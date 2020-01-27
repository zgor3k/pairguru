class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :movie, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end

    add_index :comments, [:user_id, :movie_id], unique: true
  end
end
