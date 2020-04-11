require 'rails_helper'
 RSpec.describe "Sign Up", type: :system do
  scenario "有効なEmailとPasswordで新規登録できる" do
    sign_up_with("test@example.com", "password", "password")

    txts = [I18n.t("devise.registrations.signed_up"),
            I18n.t("devise.registrations.signed_up_but_unconfirmed")]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # Emaiのテストは一旦放置
  # scenario "不正なEmaiでは新規登録できない" do
  #   sign_up_with("email", "password", "password")

  #   expect(page).to have_content("")
  # end

  scenario "パスワード無しだと新規登録できない" do
    sign_up_with("test@example.com", "", "")

    expect(page).to have_content("パスワードを入力してください")
  end

  scenario "パスワードが短いと登録できない"  do
    sign_up_with("test@example.com", "1234", "1234")

    expect(page).to have_content("パスワードは6文字以上で入力してください")
  end

  scenario "確認用パスワードを入力しないと登録できない" do
    sign_up_with("test@example.com", "password", "")

    expect(page).to have_content("パスワード（確認用）とパスワードの入力が一致しません")
  end

  scenario "確認用パスワードとパスワードが一致しないと登録できない" do
    sign_up_with("test@example.com", "password", "mismatch")

    expect(page).to have_content("パスワード（確認用）とパスワードの入力が一致しません")
  end
end
