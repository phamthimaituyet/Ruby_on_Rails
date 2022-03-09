class Comment < ApplicationRecord
  included Visible
  belongs_to :post


end
