class ChangeField < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :type, :question_type
    rename_column :multiple_choices, :type, :choice_type
  end
end
