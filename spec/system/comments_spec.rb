require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER2"]
  password = ENV["BASIC_AUTH_PASSWORD2"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "コメント投稿", type: :system do
  before do
    @target = FactoryBot.create(:target)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは目標詳細ページでコメント投稿できる' do
    # トップページに移動する
    basic_pass root_path
    visit root_path
    # ログインする
    visit new_user_session_path
    fill_in 'Eメール', with: @target.user.email
    fill_in 'パスワード', with: @target.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 目標詳細ページに遷移する
    visit target_path(@target)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    expect(current_path).to eq(target_path(@target))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
