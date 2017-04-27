class Tagging < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :inproceeding, optional:true
  belongs_to :book, optional:true
  belongs_to :tag
end
