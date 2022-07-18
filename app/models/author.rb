class Author < ApplicationRecord
    has_many  :posts, dependent: :destroy
    validates :name, presence: true
    validates :description, presence: true , length: { minimum: 15 }
end
