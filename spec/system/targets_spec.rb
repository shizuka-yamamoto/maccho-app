require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER2']
  password = ENV['BASIC_AUTH_PASSWORD2']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '目標の投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @target = FactoryBot.create(:target)
  end

  context '目標が投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 目標宣言ページへのボタンがあることを確認する
      expect(page).to have_content('目標を宣言')
      # 投稿ページに移動する
      visit new_target_path
      # フォームに情報を入力する
      fill_in 'target[content]', with: @target.content
      # 送信するとTargetモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Target.count }.by(1)
      # 投稿が完了するとトップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容の目標が存在することを確認する
      expect(page).to have_content(@target.content)
    end
  end
  context 'ツイート投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe '目標の削除', type: :system do
  before do
    @target1 = FactoryBot.create(:target)
    @target2 = FactoryBot.create(:target)
  end
  context '目標を削除できるとき' do
    it 'ログインしたユーザーは自らが投稿した目標の削除ができる' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # 目標1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @target1.user.email
      fill_in 'パスワード', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 投稿した目標1があることを確認する
      expect(page).to have_content(@target1.content)
      # 目標1をクリックすると詳細ページに移動する
      click_on(@target1.content)
      expect(current_path).to eq(target_path(@target1))
      # 削除ボタンをクリックすると目標1が削除される
      expect do
        find_link('削除', href: target_path(@target1)).click
      end.to change { Target.count }.by(-1)
      # トップページに遷移する
      visit root_path
      # トップページには目標1が存在しないことを確認する
      expect(page).to have_no_content(@target1.content.to_s)
    end
  end
  context '目標削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した目標の削除ができない' do
      # 目標1を投稿したユーザーでログインする
      basic_pass root_path
      visit root_path
      visit new_user_session_path
      fill_in 'Eメール', with: @target1.user.email
      fill_in 'パスワード', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 目標2の詳細ページには「削除」ボタンがないことを確認する
      click_on(@target2.content)
      expect(current_path).to eq(target_path(@target2))
      expect(page).to have_no_content('削除')
    end
    it 'ログインしていないと目標の削除ボタンがない' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # 目標1に「削除」ボタンがないことを確認する
      click_on(@target1.content)
      expect(current_path).to eq(target_path(@target1))
      expect(page).to have_no_content('削除')
    end
  end
end

RSpec.describe '目標詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @target = FactoryBot.create(:target)
  end
  it 'ログインしたユーザーは目標詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    basic_pass root_path
    visit root_path
    visit new_user_session_path
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 目標をクリックすると詳細ページに移動する
    click_on(@target.content)
    expect(current_path).to eq(target_path(@target))
    # 詳細ページに目標の内容が含まれている
    expect(page).to have_content(@target.content.to_s)
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態で目標詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    basic_pass root_path
    visit root_path
    # 目標をクリックすると詳細ページに移動する
    click_on(@target.content)
    expect(current_path).to eq(target_path(@target))
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_content(@target.content.to_s)
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector 'form'
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
  end
end
