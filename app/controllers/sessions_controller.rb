class SessionsController < ApplicationController
	include ActionController::Helpers
	include ActionController::Cookies

	#methods to create and destroy sessions -> basically this is authentication system from scratch
	def create
		auth = request.env["omniauth.auth"] #when press the link fb_login, response that is received from callback is stored in auth var
		session[:omniauth] = auth.except('extra') #session var with info from response, except extra- info that we dont need
		current_user = User.sign_in_from_omniauth(auth)
		session[:user_id] = current_user.id
		redirect_to root_url, flash: { notice: "#{current_user.name}, welcome to Like Machine."}
	end

	def destroy
		session.delete :user_id
		session.delete :omniauth
		redirect_to root_url, notice: "You sucessfully signed out."
	end

end