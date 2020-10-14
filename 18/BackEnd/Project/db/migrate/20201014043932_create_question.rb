class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.integer :unit_id

      t.timestamps
    end
  end
end
