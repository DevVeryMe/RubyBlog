class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    helper_method :current_user,:logged_in?, :logged_in_user,:current_user, :is_admin?
    before_action :set_cache_buster

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def is_admin?
		if !current_user.nil? && !current_user.admin.nil?
			current_user.admin == true
		else
			current_user.nil?
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to sessions_path
		end
	end


	def current_user?(user)
		user == current_user
	end

	private
	def correct_user
      @user = User.find_by(id: session[:user_id])
      redirect_to(root_url)  unless current_user?(@user)
    end

    private
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
