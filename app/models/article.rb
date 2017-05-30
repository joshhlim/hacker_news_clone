class Article < ApplicationRecord
  belongs_to :category

  def make_key
   self.key = "#{SecureRandom.urlsafe_base64(3)}"
  end

end