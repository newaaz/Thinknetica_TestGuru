class AddQuestionsToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :correct_questions, :integer, default: 0
    add_reference :results, :current_question, null: false, foreign_key: {to_table: :questions}
  end
end
