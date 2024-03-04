class Comment < Item
  validates :parent, presence: true
end
