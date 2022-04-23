module LikesHelper
    def like_count(post)
        @like = current_user.likes.find_by(post: post) 
    end
end
