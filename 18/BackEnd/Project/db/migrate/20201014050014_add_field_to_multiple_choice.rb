class AddFieldToMultipleChoice < ActiveRecord::Migration[5.2]
  def change
    add_column :multiple_choices, :unit_id, :integer
  end
end
