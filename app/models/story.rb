class Story < Item
  belongs_to :url, optional: true
  validates :title, presence: true
end
