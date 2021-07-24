class Target < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 140 }
end
