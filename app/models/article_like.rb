class ArticleLike < ApplicationRecord
  self.table_name = 'article_like'
  self.inheritance_column = :_type_disabled

  belongs_to :article, foreign_key: 'articleId'
end