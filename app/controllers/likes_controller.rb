class LikesController < ApplicationController

    def create
        @like = current_user.likes.new(like_params)
        if @like.save
            respond_to do |format|
                format.html { redirect_to posts_url}
                format.js { render '/posts/like.js.erb' }
            end
        else
            flash[:danger] = 'Already liked'
            redirect_to posts_url
        end
    end

    def destroy
        @like = current_user.likes.find(params[:id])
        @like.destroy
        respond_to do |format|
            format.html { redirect_to posts_url}
            format.js { render '/posts/like.js.erb' }
        end
    end

    private
    def like_params
        params.require(:like).permit(:post_id)
    end


end
