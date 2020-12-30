class NotificationMailer < ApplicationMailer
  def send_message(notice)
    @name = notice.name

    user = User.find(notice.user_id)
    @titles = user.purposes.all

    mail(
      from: "tester@sample.com",
      to: "1@sample.com",
      subject: "本日のタスク",
    )
  end
end
