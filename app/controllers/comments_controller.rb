class CommentsController < ApplicationController
    
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(parent_id: params[:parent_id])

    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
        @post = Post.find(params[:post_id])              # tìm bài viết đang đc comment 
        @comment = @post.comments.create(comment_params)    # tạo comment cho bài viết đó      
        
        respond_to do |format|
          if @comment.save
            format.html { redirect_to post_path(@post) }
            format.js   { }
          end
        end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment destroy!'
      redirect_to post_path(@post)
    else
      flash[:danger] = 'Cannot destroy!'
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :content, :parent_id)     # khởi tạo cmt 
  end
end
