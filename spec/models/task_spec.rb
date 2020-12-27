require "rails_helper"

RSpec.describe Task, type: :model do
  before do
    @user = create(:user)
    @purpose = create(:purpose, user_id: @user.id)
  end

  context "正常系" do
    let(:task_create) { create(:task, user_id: @user.id, purpose_id: @purpose.id) }

    context "titleが入力されている場合" do
      it "成功する" do
        expect(task_create).to be_valid
      end

      it "レコードが増える" do
        expect { task_create }.to change { Task.count }.by(1)
      end

      it "defaultの値が正常に登録されている" do
        task_create
        expect(Task.first.actual_time).to eq 1
      end
    end
  end

  context "異常系" do
    let(:task_create) { build(:task, title: nil, user_id: @user.id, purpose_id: @purpose.id) }

    it "失敗する" do
      expect(task_create).to be_invalid
    end
  end
end
