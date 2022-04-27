class Post < ApplicationRecord
    after_save :check, if: :approve_change?
    attr_accessor :admin_update
    has_many :comments
    has_one_attached :image
    belongs_to :user
    has_many :likes
    belongs_to :group,  optional: true
    validates :title, presence: true           
    validates :content, presence: true



    def self.search(term)
        if term
          where('title LIKE ?', "%#{term}%")
        else
          all
        end
    end
      

    private

    def approve_change?
        saved_changes.has_key?(:approve)
    end

    def check 
        if admin_update && !approve
            AdminMailer.post_email(user).deliver
        end
    end

    
end
