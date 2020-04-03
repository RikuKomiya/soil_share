module Systems

  module SessionHelpers

    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in "Eメール", with: email
      fill_in "パスワード", with: password
      fill_in "パスワード（確認用）", with: confirmation
      click_button "Sign up"
    end

    def sign_in(email, password)
      visit new_user_session_path
      fill_in "Eメール", with: email
      fill_in "パスワード", with: password
      click_button "Log in"
    end
  end
end