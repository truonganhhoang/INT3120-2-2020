class CreateUnit < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :book_id

      t.timestamps
    end
  end
end
