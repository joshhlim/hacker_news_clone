class Article < ActiveRecord::Base
  belongs_to :category

  validates :subject, :body, :email, :price, presence: true

  before_create do
    self.edit_url = rand(36**8).to_s(36)
  end
end
