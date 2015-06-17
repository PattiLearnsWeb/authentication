class PostsController < ApplicationController
  before_action :logged_in_user , only: [:create, :new]

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to posts_path
  	else
  		flash.now[:danger] = 'Something went wrong!'
  		render 'new'
  	end
  end

  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def post_params
  	params.require(:post).permit(:secret_text)
  end
end
