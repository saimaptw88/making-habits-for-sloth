require "rails_helper"

RSpec.describe "Api::V1::Users::Registrations", type: :request do
  describe "POST   /api/v1/users" do
    subject { post(api_v1_user_registration_path, params: params) }

    context "正常系" do
      let(:params){ attributes_for(:user) }
      let(:res){ JSON.parse(response.body) }

      it "レスポンスが正常" do
        subject
        expect(response).to have_http_status :ok
      end

      fit "登録成功" do
        expect { subject }.to change { User.count }.by(1)
      end
    end
  end
end
