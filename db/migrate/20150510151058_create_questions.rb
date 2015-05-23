class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :text
      t.string      :answer_type
      t.belongs_to  :user

      t.timestamps null: false
    end
  end
end
