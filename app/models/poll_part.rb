class PollPart < Item
  validates :parent_item, presence: true
end
