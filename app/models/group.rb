class Group < ApplicationRecord
    has_many :group_members
    has_many :posts
    
end
