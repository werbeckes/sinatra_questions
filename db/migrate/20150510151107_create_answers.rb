class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :value
      t.belongs_to :question
      t.timestamps null: false
    end
  end
end
