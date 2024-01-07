class Comment < ApplicationRecord
  belongs_to :post
  has_rich_text :content

  # broadcasts_to :post
  broadcasts_refreshes_to :post
end
