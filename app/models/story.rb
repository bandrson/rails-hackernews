class Story < Item
  belongs_to :url, optional: true
  validates :title, presence: true

  def self.search_by_title(query)
    if query
      Story.where("title LIKE ?", "%#{query}%")
    else
      []
    end
  end
end
