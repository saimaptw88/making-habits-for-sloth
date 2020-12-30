# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  term       :integer          default(66), not null
#  time       :integer          default(1), not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_purposes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
