class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @user ||= User.where("id=?",session[:user_id]).last
  end
  helper_method :current_user
   
 private   
	def require_login
		if current_user.nil?
			redirect_to user_path(@user)
		end
	end
end
