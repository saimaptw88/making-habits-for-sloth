require "rails_helper"

RSpec.describe "Api::V1::Users::Sessions", type: :request do
  describe "POST   /api/v1/users/sign_in" do
    subject { post(api_v1_user_session_path, params: params) }

    context "正常系" do
      let(:params){ attributes_for(:user) }
      let(:res){ JSON.parse(response.body) }

      it "レスポンスが正常" do
        subject
        expect(response).to have_http_status :ok
      end
    end
  end

  describe "DELETE /api/v1/users/sign_out" do
    subject { delete(destroy_api_v1_user_session_path) }

    it "レスポンスが正常" do
      subject
      expect(response).to have_http_status :ok
    end
  end
end
