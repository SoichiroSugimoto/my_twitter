class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to("/users/#{user.id}")
		else
			redirect_to("/")
		end
	end

	def destroy
		log_out
		redirect_to("/")
	end
end
