class PostsController < ActionController::Base
  
  def index
    @posts = Post.find(:all, :order => "created_at DESC")
    @post = Post.find_by_id(params[:id])
    # @posts.attachments = Attachment.find_by_id(params[:post_id])
    # @attachments = Attachment.find(:all, :order => "created_at DESC")
  end

  def new
    @post = Post.new
    @post.user = User.find_by_id(params[:user_id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @post.attachment = Attachment.find_by_id(params[:post_id])
  end
  
  def create
    @post = Post.new(params[:post])
    
    @post.save
    redirect_to posts_url
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

end

