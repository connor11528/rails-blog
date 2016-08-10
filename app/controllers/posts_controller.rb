class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	# Index action shows all posts
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	# saves post in the database
	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Post created!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating post"
			render :new
		end
	end

	# retrieves post and renders edit page
	def edit
	end

	# update a post
	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Post updated!"
			redirect_to post_path(@posts)
		else
			flash[:alert] = "Error updating post"
			render :edit
		end
	end

	def show
	end

	# delete from database
	def destroy
		if @post.destroy
			flash[:notice] = "Post deleted!"
			redirect_to posts_path
		else
			flash[:alert] = "Error deleting post"
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
