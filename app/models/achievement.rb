class Achievement < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '達成できた' },
    { id: 3, name: '達成できなかった' },
    { id: 4, name: 'そもそも目標を立てていない' }
  ]
  include ActiveHash::Associations
  has_many :reviews
end
