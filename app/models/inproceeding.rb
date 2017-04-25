class Inproceeding < ApplicationRecord
	validates :author, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :booktitle, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end