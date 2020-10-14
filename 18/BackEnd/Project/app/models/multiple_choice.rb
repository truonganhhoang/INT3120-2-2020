class MultipleChoice < ApplicationRecord
  belongs_to :unit

  serialize :wrong_answer, Array

  enum type: { en_to_vi: 0, vi_to_en: 1, audio: 2 }
  enum difficult: { easy: 0, hard: 1 }
end
