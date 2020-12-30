# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview
  def send_message
    @user = User.first
    @purpose = @user.purposes.first

    notice = Notification.new(name: @user.email, title: @purpose.title, user_id: @user.id, purpose_id: @purpose.id)
    NotificationMailer.send_message(notice)
  end
end
