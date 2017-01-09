class Url < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, :with => /^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, on: :create
  validates :short_url,uniqueness: true
  before_validation :generate_short_url

  ROOT_URL='http://localhost:3000/'

  private

  def generate_short_url
    self.short_url = SecureRandom.hex(2) until Url.find_by(short_url: self.short_url).nil?
  end
end
