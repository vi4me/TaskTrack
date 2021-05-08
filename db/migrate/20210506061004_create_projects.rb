class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :complexity, limit: 5, null: false
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
