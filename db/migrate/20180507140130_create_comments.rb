class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :lecture_id
      t.timestamps
    end
  end
end
