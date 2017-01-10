class Url < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, with: /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, on: :create
  validates :short_code,uniqueness: true
  before_validation :generate_short_code_url

  private

  def generate_short_code_url
    code = random_short_code
    until Url.find_by(short_code: code).nil?
      code = random_short_code
    end
    self.short_code = code
    self.short_url = self.root + self.short_code
  end

  def random_short_code
    SecureRandom.hex(2)
  end
end
