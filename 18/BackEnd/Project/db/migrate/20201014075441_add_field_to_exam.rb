class AddFieldToExam < ActiveRecord::Migration[5.2]
  def change
    add_column :multiple_choices, :difficult, :integer
    add_column :questions, :difficult, :integer
    add_column :multiple_choices, :type, :integer
    add_column :questions, :type, :integer
  end
end
