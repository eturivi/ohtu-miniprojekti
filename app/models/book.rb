class Book < ApplicationRecord
  validates :author, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false
  validates :publisher, presence: true, allow_blank: false
  validates :key, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  include Taggable
end
