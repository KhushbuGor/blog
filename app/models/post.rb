class Post < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :text, presence: true 
end
