class Post < ApplicationRecord
  belongs_to :author
  validates :title, presence: true, length: { maximum: 10 }
  validates :text, presence: true , length: { minimum: 15 }
end
