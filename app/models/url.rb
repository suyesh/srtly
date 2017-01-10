class Url < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, :with => /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, on: :create
  validates :short_code,uniqueness: true
  before_validation :generate_short_code_url

  #ROOT_URL = 'http://srtly.io/'
  ROOT_URL = 'http://localhost:3000/'
  private

  def generate_short_code_url
    self.short_code = SecureRandom.hex(2) #until Url.find_by(short_code: self.short_code).nil?
    self.short_url = ROOT_URL + self.short_code
  end
end
