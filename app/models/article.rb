class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  # tags = article.taggings.map { |tagging| tagging.tag }

  def tag_list
    tags.map { |tag| tag.name }.join(", ")
  end

  def tag_list=(tags_string)
    tag_names    = tags_string.downcase.scan(/\w+/).uniq
    article_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    self.tags    = article_tags
  end
end
