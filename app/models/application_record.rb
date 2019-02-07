class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_img_url(url)
    url.gsub("public:/", "https://52japan.com/files")
  end
end
