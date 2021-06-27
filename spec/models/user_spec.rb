require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネームとEメール、パスワードとパスワード(確認用)が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'Eメールは一意性あれば登録できる' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email != @user.email
        expect(@user).to be_valid
      end
      it 'Eメールに@が含まれていれば登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it 'パスワードとパスワード(確認用)は6文字以上であれば登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
      it 'パスワードとパスワード(確認用)は英数混合であれば登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'Eメールが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'Eメールに@がないと登録できない' do
        @user.email = 'abcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したEメールが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが存在してもパスワード(確認用)が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）が5文字以下では登録できない' do
        @user.password = '1a1a1'
        @user.password_confirmation = '1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは英数字混合でないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合での入力が必要です')
      end
    end
  end
end
