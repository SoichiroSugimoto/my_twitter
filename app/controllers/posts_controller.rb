class PostsController < ApplicationController
	def create
		@post = current_user.posts.build(post_params)
		@post.save
		redirect_to "/users/#{params[:id]}"
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
	end

	private
		def post_params
			params.require(:post).permit(:body)
		end
end
