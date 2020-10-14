class Unit < ApplicationRecord
  has_many :new_words
  belongs_to :book
end
    