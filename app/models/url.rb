class Url < ApplicationRecord
  # Validation test

  validates :long_url, uniqueness: {case_sensitive: false, message: "was shortened before"}
  validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}

  before_save :shorten #run this method before i save url into my database, utilising SecureRandom from ruby
  before_create :shorten



  def shorten
    self.short_url= SecureRandom.hex(4)
  end
end
