class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings
  has_many :inproceedings, through: :taggings
  validates :name, presence: true, allow_blank: false
end
