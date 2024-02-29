class Story < Item
  belongs_to :url
  validates :title, presence: true
end
