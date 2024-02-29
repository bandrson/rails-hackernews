class PollPart < Item
  belongs_to :poll
  validates :parent_item, presence: true
end
