class Item < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  validates :user, presence: true
  validates :title, length: {minimum: 2, maximum: 80}
  validates :body, length: {maximum: 40000}
  validates :dead, presence: true
  validates :deleted, presence: true
end
