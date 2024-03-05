class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user, presence: true
  validates :item, presence: true
  validates :vote, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote" }, presence: true

  after_save :recalculate_item_score
  after_save :recalculate_item_score

  private
  def recalculate_item_score
    item.calculate_score
  end
end
