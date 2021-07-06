class Review < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :achievement
	belongs_to :user

	validates :text, presence: true
	validates :achievement_id, numericality: { other_than: 1 } 
end
