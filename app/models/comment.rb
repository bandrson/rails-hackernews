class Comment < Item
  belongs_to :item
  validates :parent_item, presence: true
end
