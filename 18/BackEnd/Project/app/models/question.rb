class Question < ApplicationRecord
  belongs_to :unit

  enum question_type: { en_vi: 0, vi_en: 1, audio: 2 }
  enum difficult: { easy: 0, hard: 1 }
end
