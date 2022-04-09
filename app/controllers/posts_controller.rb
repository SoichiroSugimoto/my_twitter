class PostsController < ApplicationController
	before_action :correct_user, only: :destroy

	def index
		@posts = Post.all
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.save
		redirect_to "/users/#{@post.user_id}"
	end

	def destroy
		@post.destroy
		redirect_to "/users/#{@post.user_id}"
	end

	private
		def post_params
			params.require(:post).permit(:body)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to root_url if @post.nil?
		end
end
