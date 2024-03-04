class Item < ApplicationRecord
  extend ActsAsTree::TreeWalker
  acts_as_tree order: 'id', counter_cache: true

  belongs_to :user
  belongs_to :parent_item, class_name: "Item", optional: true
  has_many :children, class_name: "Item", foreign_key: "parent_id"
  has_many :votes
  has_many :voters, through: :votes, source: :user
  validates :user, presence: true
  validates :title, length: {minimum: 2, maximum: 80}, allow_blank: true
  validates :body, length: {maximum: 40000}
  validates :dead, presence: true, allow_blank: true
  validates :deleted, presence: true, allow_blank: true
end
