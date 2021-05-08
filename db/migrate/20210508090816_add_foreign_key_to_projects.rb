class AddForeignKeyToProjects < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :projects, :users
  end
end
