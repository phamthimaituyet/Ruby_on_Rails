class LikesController < ApplicationController

    def create
        @like = current_user.likes.new(like_params)
        
        if @like.save
            flash[:success] = 'Liked!'
            redirect_to posts_url
        else
            flash[:danger] = 'Already liked'
            redirect_to posts_url
        end

    end

    def destroy
        @like = current_user.likes.find(params[:id])
        @like.destroy
        redirect_to posts_url
    end

    private
    def like_params
        params.require(:like).permit(:post_id)
    end


end
