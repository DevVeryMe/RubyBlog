class UsersController < ApplicationController
	before_action :logged_in_user, only: [:new, :show, :edit]
    before_action :correct_user, only: [:new, :show, :edit]

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
      @user = User.find_by(id: session[:user_id])
    end

    def edit
      	@user = User.find_by(id: session[:user_id])
    end

    def update
    	@user = User.find_by(id: session[:user_id])

		if(@user.update(edit_params))
			redirect_to @user
		else
			render 'edit'
		end
    end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin => false)
		end

		def edit_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :old_password)
		end
end
