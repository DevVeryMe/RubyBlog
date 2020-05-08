class UsersController < ApplicationController
	before_action :logged_in_user, only: [:new, :show]
    before_action :correct_user, only: [:new, :show]

    def index
      @users = User.all
    end

    def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to home_path
		else
			flash[:register_errors] = user.errors.full_messages
			redirect_to login_path
		end
	end

    def show
      @user = User.find(params[:id])
      @posts = @user.posts
    end

    def edit
      @user = User.find(params[:id])
    end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
