class Post < ApplicationRecord
  validates :title, length: { maximum: 30 }
end
