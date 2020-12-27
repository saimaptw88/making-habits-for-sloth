require "rails_helper"

RSpec.describe Purpose, type: :model do
  before { @user = create(:user) }

  context "正常系" do
    context "入力されている場合" do
      let(:purpose_create) { create(:purpose, user_id: @user.id) }

      it "成功する" do
        expect(purpose_create).to be_valid
      end

      it "dbに追加される" do
        expect { purpose_create }.to change { Purpose.count }.by(1)
      end
    end
  end

  context "異常系" do
    let(:purpose_create) { build(:purpose, title: nil, user_id: @user.id) }

    it "失敗する" do
      expect(purpose_create).to be_invalid
    end
  end
end
