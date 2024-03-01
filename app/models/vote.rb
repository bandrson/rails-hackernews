class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user, presence: true
  validates :item, presence: true
  validates :vote, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote" }, presence: true
end
