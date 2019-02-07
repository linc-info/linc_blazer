class Article < ApplicationRecord
  self.table_name = 'article'
  self.inheritance_column = :_type_disabled

  has_many :article_likes, foreign_key: 'articleId'

  def img
    get_img_url(originalThumb)
  end
end