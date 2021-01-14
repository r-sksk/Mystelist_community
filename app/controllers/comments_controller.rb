class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @post.create_notification_comment(current_user, @comment.id)
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :content)
    end
end
