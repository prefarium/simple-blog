class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  # tags = article.taggings.map { |tagging| tagging.tag }

  # Displays tags on edit page
  def tag_list
    tags.map { |tag| tag.name }.join(', ')
  end

  def tag_list=(tags_string)
    tag_names    = tags_string.downcase.scan(/\w+/).uniq
    article_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    self.tags    = article_tags
  end
end
