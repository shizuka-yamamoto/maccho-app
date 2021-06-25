class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :target

	validates :text, presence: true
end
