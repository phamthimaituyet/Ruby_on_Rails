class Post < ApplicationRecord
    included Visible
    has_many :comments
    has_one_attached :image
    belongs_to :user
    has_many :likes
end
