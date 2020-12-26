require "rails_helper"

RSpec.describe "GET /users/sign_up", type: :system do
  it "ユーザー登録に成功する" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_current_path api_v1_purpose_index_path, ignore_query: true
  end
end
