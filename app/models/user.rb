class User < ApplicationRecord
  has_many :items
  has_many :votes
  has_many :voted_items, through: :votes, source: :item
  validates :username, length: { minimum: 2 }, uniqueness: { case_sensitive: false }, presence: true
  validates :about, length: {maximum: 10000}, presence: true
end
