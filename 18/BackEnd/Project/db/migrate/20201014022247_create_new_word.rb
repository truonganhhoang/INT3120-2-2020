class CreateNewWord < ActiveRecord::Migration[5.2]
  def change
    create_table :new_words do |t|
      t.string :word_en
      t.string :word_vi
      t.integer :unit_id

      t.timestamps
    end
  end
end
