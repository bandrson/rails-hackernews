class Item < ApplicationRecord
  belongs_to :user
  belongs_to :parent_item, class_name: "Item", optional: true
  has_many :votes
  has_many :voters, through: :votes, source: :user
  validates :user, presence: true
  validates :title, length: {minimum: 2, maximum: 80}, allow_blank: true
  validates :body, length: {maximum: 40000}
  validates :dead, presence: true, allow_blank: true
  validates :deleted, presence: true, allow_blank: true
end
