class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :status
      t.integer :zombie_id

      t.timestamps
    end
    add_index :tweets, :zombie_id
  end
end
