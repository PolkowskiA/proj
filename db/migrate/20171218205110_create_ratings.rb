class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score
      t.integer :default

      t.timestamps
    end
  end
end
