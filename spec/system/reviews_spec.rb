require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER2']
  password = ENV['BASIC_AUTH_PASSWORD2']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '振り返りの投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
  end

  context '振り返りが投稿できるとき' do
    it 'ログインしたユーザーは振り返りの投稿ができる' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 振り返り投稿ページに移動する
      visit new_review_path
      # フォームに情報を入力する
      select '達成できた', from: 'review_achievement_id'
      fill_in 'review[text]', with: @review.text
      # 送信するとReviewモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Review.count }.by(1)
      # 投稿が完了するとマイページに遷移する
      visit user_path(@user)

    end
  end
end

