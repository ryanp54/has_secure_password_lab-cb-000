class UsersController < ApplicationController

	def welcome
		render text: "hi, #{User.find(session[:user_id]).name}"
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to welcome_path
		else
			redirect_to new_user_path
		end
	end

		private
	  
	  def user_params
	    params.require(:user).permit(:name, :password, :password_confirmation)
	  end

end
