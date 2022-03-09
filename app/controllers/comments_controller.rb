class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])              # tìm bài viết đang đc comment 
        @comment = @post.comments.create(comment_params)    # tạo comment cho bài viết đó 
        redirect_to post_path(@post)                     # điều hướng bài viết cũ 
      end
    private
    def comment_params
      params.require(:comment).permit(:commenter, :content, :status)     # khởi tạo cmt 
    end
end
