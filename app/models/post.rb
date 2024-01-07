class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_rich_text :content
  has_one_attached :poster
  broadcasts_refreshes
end
