class Post < ApplicationRecord
    has_many :comments
    has_one_attached :image
    belongs_to :user
    has_many :likes
    belongs_to :group,  optional: true
    validates :title, presence: true            # khong dc de trong 
    validates :content, presence: true
end
