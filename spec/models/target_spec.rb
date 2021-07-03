require 'rails_helper'

RSpec.describe Target, type: :model do
  before do
    @target = FactoryBot.build(:target)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it 'テキストが入力されていれば投稿できる' do
        expect(@target).to be_valid
      end
    end

    context '投稿が保存できない場合' do
      it 'テキストが空では投稿できない' do
        @target.content = ''
        @target.valid?
        expect(@target.errors.full_messages).to include('Contentを入力してください')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @target.user = nil
        @target.valid?
        expect(@target.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
