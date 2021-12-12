class Post < ApplicationRecord
  binding.pry
  validates :title, length: { maximum: 30 }
end
