class SessionsController < ApplicationController
	def new
  	end

	def create
		user = User.find_by(email:login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			session[:user_name] = user.email
			redirect_to home_path
		else
			flash[:login_errors] = ['invalid credentionals']
			render 'new'
		end

	end

	def destroy
		@current_user = nil
	    reset_session
	    redirect_to home_path
  	end
  	
	private
		def login_params
			params.require(:login).permit(:email, :password)
		end
end
