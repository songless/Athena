class PostsController < ApplicationController
  before_filter :authenticate
  
  def new
    @post = Post.new
  end
  
  def create
    #@post = Post.new(params[:post])
    @post = current_user.build_post(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def update
    @post = Post.find(params[:id])
    @post.attributes = params[:post]
    @user = current_user
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
