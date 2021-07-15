require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it 'テキストがありachievement_id1以外であれば投稿できる' do
        expect(@review).to be_valid
      end
    end
    it 'achievement_idがid:1以外であれば登録できる' do
      @review.achievement_id = 2
      expect(@review).to be_valid
    end

    context '投稿が保存できない場合' do
      it 'テキストが空では投稿できない' do
        @review.text = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('Textを入力してください')
      end
      it 'achievement_idがid:1では登録できない' do
        @review.achievement_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('Achievementは1以外の値にしてください')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
