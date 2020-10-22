# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Unit.destroy_all
Question.destroy_all
NewWord.destroy_all
MultipleChoice.destroy_all

book = Book.create(title: "Hack não 1500 từ bản 2020")

(1..50).each do |u|
    Unit.create(name: "Unit #{u}", book_id: book.id)
end

Question.create(unit: Unit.first, content: "course", answer: "khóa học", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "shy", answer: "nhút nhát", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "confident", answer: "tự tin", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "beautiful", answer: "xinh đẹp", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "conference", answer: "hội nghị", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "brochure", answer: "sách mỏng", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "brief", answer: "ngắn gọn", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "extreme", answer: "cùng cực", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "hint", answer: "gợi ý", question_type: 0, difficult: 0 )
Question.create(unit: Unit.first, content: "blame", answer: "chỉ trích", question_type: 0, difficult: 0 )

NewWord.create(unit: Unit.first, word_en: "course", word_vi: "khóa học")
NewWord.create(unit: Unit.first, word_en: "shy", word_vi: "nhút nhát")
NewWord.create(unit: Unit.first, word_en: "confident", word_vi: "tự tin")
NewWord.create(unit: Unit.first, word_en: "beautiful", word_vi: "xinh đẹp")
NewWord.create(unit: Unit.first, word_en: "conference", word_vi: "hội nghị")
NewWord.create(unit: Unit.first, word_en: "brochure", word_vi: "sách mỏng")
NewWord.create(unit: Unit.first, word_en: "brief", word_vi: "ngắn gọn")
NewWord.create(unit: Unit.first, word_en: "extreme", word_vi: "cùng cực")
NewWord.create(unit: Unit.first, word_en: "hint", word_vi: "gợi ý")
NewWord.create(unit: Unit.first, word_en: "blame", word_vi: "chỉ trích")

MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
MultipleChoice.create(unit: Unit.first, content: "She is a ... girl.", right_answer: "beautiful", wrong_answer: %w(handsome course abroad), choice_type: 0, difficult: 0)
