class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :target, dependent: :destroy

  validates :text, presence: true
end
