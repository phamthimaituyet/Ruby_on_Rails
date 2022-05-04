class RepliesController < ApplicationController
    before_action do
      @comment = Comment.find(params[:comment_id])
    end
  
    def index
      @replies = @comment.replies
      @reply = @comment.replies.new
    end
  
    def new
      @reply = @comment.replies.new
    end
  
    def create
      @reply = @comment.replies.new(reply_params)
      #redirect somewhere
    end
end