class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :avatar
  has_many :likes ,foreign_key: 'user_id'
  has_many :groups

  def three_next_birthdays
    a = [0,1,2]
    a.each do |i|
      a[i] = Date.new Date.current.year + i, birthday.month, birthday.day
    end
  end

end
