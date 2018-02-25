class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:name])
		redirect_to login_path unless @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect_to welcome_path
	end

end
