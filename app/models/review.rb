class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :achievement, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :text, presence: true
  validates :achievement_id, numericality: { other_than: 1 }
end
