require "rails_helper"

RSpec.describe "NotificationMailer", type: :mailer do
  describe "notification mailer" do
    subject(:mail) do
      notice = Notification.new(name: "saito", title: "programing", user_id: @user.id, purpose_id: @purpose.id)
      NotificationMailer.send_message(notice)
    end

    before do
      @user = create(:user)
      @purpose = create(:purpose, user_id: @user.id)
    end

    context "when send_mail" do
      it "送り主のアドレスが正しい" do
        expect(mail.from.first).to eq("tester@sample.com")
      end

      it "送り先のアドレスが正しい" do
        expect(mail.to.first).to eq("1@sample.com")
      end

      it "タイトルが正しい" do
        expect(mail.subject).to eq("本日のタスク")
      end
    end
  end
end
