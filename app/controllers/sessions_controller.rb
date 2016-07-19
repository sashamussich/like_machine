class SessionsController < ApplicationController

	#methods to create and destroy sessions -> basically this is authentication system from scratch
	def create
		auth = request.env["omniauth.auth"] #when press the link fb_login, response that is received from callback is stored in auth var
		session[:omniauth] = auth.except('extra') #session var with info from response, except extra- info that we dont need
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_url, notice: "Sucessfully signed in."
	end

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "Sucessfully signed out."
	end

end