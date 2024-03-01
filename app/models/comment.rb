class Comment < Item
  validates :parent_item, presence: true
end
