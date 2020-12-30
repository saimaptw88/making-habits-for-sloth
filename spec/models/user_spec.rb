# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  context "新規のemail" do
    let(:user) { create(:user) }

    it "登録に成功" do
      expect { user }.to change { User.count }.by(1)
    end
  end

  context "既存のemail" do
    before { @user = create(:user) }

    let(:user) { build(:user, email: @user.email) }

    it "エラーする" do
      expect(user).to be_invalid
    end
  end

  context "password" do
    context "入力されている場合" do
      let(:user) { create(:user) }
      it "登録に成功" do
        expect { user }.to change { User.count }.by(1)
      end
    end

    context "空の場合" do
      before { @user = create(:user) }

      let(:user) { build(:user, email: @user.email) }

      it "エラーする" do
        expect(user).to be_invalid
      end
    end
  end
end
