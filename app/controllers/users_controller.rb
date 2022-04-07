class UsersController < ApplicationController
	def home
		if session[:user_id]
			@notice = "Login Name : #{current_user.name} (#{current_user.id})\n"
		else
			@notice = "You are not login\n"
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to ("/users/#{@user.id}")
			session[:user_id] = @user.id
		else
			redirect_to("/")
		end
	end

	def index
	end

	def show
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
end
