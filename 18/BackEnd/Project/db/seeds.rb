# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Unit.destroy_all

book = Book.create(title: "Hack não 1500 từ bản 2020")

(1..50).each do |u|
    Unit.create(name: "Unit #{u}", book_id: book.id)
end

Question.create(unit: Unit.first, content: "course", answer: "khóa học", question_type: 0, difficult: 0 )
