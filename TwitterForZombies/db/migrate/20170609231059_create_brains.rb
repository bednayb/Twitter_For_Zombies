class CreateBrains < ActiveRecord::Migration[5.0]
  def change
    create_table :brains do |t|
      t.string :status
      t.integer :zombie_id
      t.string :flavor

      t.timestamps
    end
    add_index :brains, :zombie_id
  end
end
