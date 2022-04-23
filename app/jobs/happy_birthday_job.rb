class HappyBirthdayJob < ApplicationJob
  queue_as :default

  def perform(user)
    AdminMailer.user_email(user).deliver_now
  end
end
