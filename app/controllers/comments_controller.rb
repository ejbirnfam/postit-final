class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    #@comment = Comment.new(params.require(:comment).permit(:body))
    #@comment.post = @post
    #these two lines can be combined to...
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = User.first #need to fix after authentication

    if @comment.save
      flash[:notice] = 'Your comment was added'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end