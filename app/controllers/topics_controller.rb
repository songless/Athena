class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
  
  def new
    @post = Post.new
    @topic = Topic.new
  end
  
 def create  
   @topic = Topic.new(params[:topic])  
   if @topic.save
     begin
     @topic = Topic.new(:name => params[:topic][:name], :last_poster_id => current_user.id, :last_post_at => Time.now, :forum_id => params[:topic][:forum_id])  
     rescue
     end
     if @post.save  
       flash[:notice] = "Successfully created topic."  
       redirect_to "/forums/#{@topic.forum_id}"  
     else  
       redirect :action => 'new'  
     end  
   else  
     render :action => 'new'  
   end  
 end  
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:notice] = "Successfully updated topic."
      redirect_to "/forums/#{@topic.forum_id}"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "Successfully destroyed topic."
    redirect_to "/forums/#{@topic.forum_id}"
  end
end
