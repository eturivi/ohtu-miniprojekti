class Tagging < ApplicationRecord
  belongs_to :article
  belongs_to :inproceeding
  belongs_to :tag
end
