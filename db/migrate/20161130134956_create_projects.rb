class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps
    end
<<<<<<< HEAD
    add_column :projects, :user_id, :integer
=======
    add_index :projects, :user_id, :integer
>>>>>>> 0e80d7311c0b7b25923d2d5bf3fc97578f059b7e
  end
end
