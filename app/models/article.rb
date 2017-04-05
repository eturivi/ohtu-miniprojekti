class Article < ApplicationRecord
  validates :author, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false
  validates :journal, presence: true, allow_blank: false
  validates :volume, presence: true, allow_blank: false

end
