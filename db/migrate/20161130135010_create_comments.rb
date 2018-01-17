class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.integer :rating
      t.text :content
      t.integer :project_id
      t.timestamps
    end
  end
end
