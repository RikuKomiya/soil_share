require 'rails_helper'

RSpec.describe 'Address', type: :system do
  let(:user) { create(:user) }
  before do
    login_as(user, :scope => :user)
  end

  describe '新規登録' do
    before do
      visit new_address_path
    end
    scenario '有効な情報で登録' do
      # 郵便番号入力だけで他のフィールドが埋まるか
      fill_in '郵便番号', with: '2720804'
      expect(page).to have_field '都道府県', with: '千葉県'
      expect(page).to have_field '市区町村', with: '市川市'
      expect(page).to have_field '番地', with: '南大野'
  
      # 保存できるか
      click_button '保存'
      expect(page).to have_content '登録しました'
  
    end
  
    scenario '無効な値を入力するとエラーが出る' do
      click_button '保存'
      expect(page).to have_content '正しい郵便番号を入力してください'
      expect(page).to have_content '都道府県を入力してください'
      expect(page).to have_content '市区町村を入力してください'
      expect(page).to have_content '番地を入力してください'

      fill_in '郵便番号', with: "245678"
      expect(page).to have_content '正しい郵便番号を入力してください'
    end
  end
  
end