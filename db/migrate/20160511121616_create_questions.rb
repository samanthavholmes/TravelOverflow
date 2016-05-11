class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
