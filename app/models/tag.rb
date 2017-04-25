class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings
  has_many :inproceedings, through: :taggings
  validates :name, presence: true, allow_blank: false
end
