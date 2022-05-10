class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_save :ban
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :avatar
  has_many :likes ,foreign_key: 'user_id'
  has_many :group_members

  private

  def ban
    if !status
        AdminMailer.user_email(self).deliver
    end
end
end
