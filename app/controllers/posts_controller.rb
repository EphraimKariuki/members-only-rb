class PostsController < ApplicationController
before_action :authenticate_user!, only: [ :new, :create ]

def index
  @posts = Post.all
end

def new
  @user = User.find(params[:user_id])
  @post = @user.posts.new
end
def create
  @user = User.find(params[:user_id])
  @post = @user.posts.new(post_params)

  if @post.save
    redirect_to posts_path
  else
    render :new
  end
end

private
  def post_params
    params.expect(post: [ :title, :body ])
  end
end
