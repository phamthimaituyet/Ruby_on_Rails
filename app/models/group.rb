class Group < ApplicationRecord
    included Visible
    belongs_to :user
    has_many :posts
    
end
