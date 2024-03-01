class Url < ApplicationRecord
  has_many :story
  validates :url, url: true, presence: true
end
