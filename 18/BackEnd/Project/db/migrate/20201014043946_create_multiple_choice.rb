class CreateMultipleChoice < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_choices do |t|
      t.text :content
      t.text :right_answer
      t.text :wrong_answer

      t.timestamps
    end
  end
end
