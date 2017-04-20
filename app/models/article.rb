class Article < ApplicationRecord
  validates :author, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false
  validates :journal, presence: true
  validates :volume, presence: true

  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(names)

    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end

    self.tags = names.split(",").map { |name|
      begin
        Tag.where(name: name.strip).first_or_create!
      rescue ActiveRecord::RecordInvalid
        nil
      end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
