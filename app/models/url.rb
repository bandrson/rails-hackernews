class UrlValidator < ActiveRecord::Validator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)
    unless uri.kind_of?(URI::HTTP)
      record.errors.add(attribute, (options[:message] || "is not a URL"))
    end
  end
end

class Url < ApplicationRecord
  has_many :story
  validates :url, url: true, presence: true
end
