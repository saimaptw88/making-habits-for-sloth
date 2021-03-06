require "rails_helper"

RSpec.describe "sessions", type: :system, js: false do
  before { @user = create(:user) }

  let(:login) do
    visit new_user_session_path
    fill_in "Name", with: @user.name
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
  end

  it "ログイン成功" do
    login
    expect(page).to have_current_path api_v1_purpose_index_path, ignore_query: true
  end

  it "ログアウト成功" do
    login
    visit logout_path
    expect(page).to have_current_path new_user_registration_path, ignore_query: true
  end
end
