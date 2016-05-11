class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
