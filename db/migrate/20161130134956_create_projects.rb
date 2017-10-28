class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps
    end
    add_column :projects, :user_id, :integer
  end
end
