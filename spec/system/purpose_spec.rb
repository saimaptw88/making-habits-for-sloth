require "rails_helper"

RSpec.describe "purpose", type: :system, js: false do
  before do
    @user = create(:user)
    @purpose = create(:purpose, user_id: @user.id)
  end

  let(:login) do
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
  end

  # index
  describe "GET /api/v1/purpose" do
    it "ログイン成功" do
      login
      expect(page).to have_current_path api_v1_purpose_index_path
    end

    context "new" do
      it "画面がnewに遷移する" do
        login
        click_link "New purpose"
        expect(page).to have_current_path new_api_v1_purpose_path
      end
    end

    context "show" do
      it "画面がshowに遷移する" do
        login
        click_link @purpose.title
        expect(page).to have_current_path "/api/v1/purpose/#{@purpose.id}"
      end
    end

    context "edit" do
      it "画面がeditに遷移する" do
        login
        click_link "Edit"
        expect(page).to have_current_path "/api/v1/purpose/#{@purpose.id}/edit"
      end
    end

    context "destroy" do
      let(:destroy) { click_link "Destroy" }
      let(:alert) { page.driver.browser.switch_to.alert.accept }
      let(:click_alert) do
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
      end

      it "data-confirmの内容が正しい" do
        login
        destroy
        expect(page.accept_confirm).to eq "Are you sure?"
      end

      it "削除後の表示文が正しい" do
        login
        destroy
        click_alert
        expect(page).to have_content "Purpose was successfully destroyed."
      end

      it "purposeの削除に成功する" do
        login
        destroy
        expect { click_alert }.to change { Purpose.count }.by(-1)
      end
    end

    context "log out" do
      it "ログアウトに成功する" do
        login
        click_link "log out"
        sleep 0.5
        expect(page).to have_current_path new_user_registration_path
      end
    end
  end

  # show
  describe "GET /api/v1/purpose/:id" do
    before do
      login
      click_link @purpose.title.to_s
    end

    context "editをクリックした場合" do
      it "editへの移動" do
        click_link "Edit"
        expect(page).to have_current_path "/api/v1/purpose/#{@purpose.id}/edit"
      end
    end

    context "Backをクリックした場合" do
      it "backへの移動" do
        click_link "Back"
        expect(page).to have_current_path api_v1_purpose_index_path
      end
    end
  end

  # new, create ( = new purpose )
  describe "GET /api/v1/purpose/new" do
    before do
      login
      click_link "New purpose"
    end

    let(:make) { click_button "作成" }
    let(:back) { click_link "Back" }

    context "titleが入力されている場合" do
      before { fill_in "Title", with: @purpose.title }

      it "遷移先が正しい" do
        make
        expect(page).to have_current_path api_v1_purpose_index_path
      end

      it "作成に成功後の表示分が正しい" do
        make
        expect(page).to have_content "Purpose was successfully created."
      end

      it "作成に成功する" do
        expect { make }.to change { Purpose.count }.by(1)
      end

      it "backに成功する" do
        back
        expect(page).to have_current_path api_v1_purpose_index_path
      end
    end

    context "titleが入力されていない場合" do
      it "ページ遷移できない" do
        make
        expect(page).to have_current_path api_v1_purpose_index_path
      end

      it "作成されない" do
        expect { make }.to change { Purpose.count }.by(0)
      end

      it "backに成功する" do
        back
        expect(page).to have_current_path api_v1_purpose_index_path
      end
    end
  end

  # update
  describe "PATCH /api/v1/purpose/:id" do
    # ログインして、@purposeのedit画面へ遷移
    before do
      login
      click_link "Edit"
    end

    context "値を変更する場合" do
      before { fill_in "Title", with: "test" }

      it "画面の遷移が成功する" do
        click_button "更新"
        expect(page).to have_current_path api_v1_purpose_index_path
      end

      it "変更に成功する" do
        click_button "更新"
        expect(Purpose.find(@purpose.id).title).to eq "test"
      end
    end

    context "値を変更しない場合" do
      it "画面の遷移が成功する" do
        click_button "更新"
        expect(page).to have_current_path api_v1_purpose_index_path
      end

      it "変更に成功する" do
        click_button "更新"
        expect(Purpose.first.title).to eq @purpose.title
      end
    end
  end
end
