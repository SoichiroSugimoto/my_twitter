class UsersController < ApplicationController
	def home
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to ("/users/#{@user.id}")
	end

	def index
	end

	def show
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
