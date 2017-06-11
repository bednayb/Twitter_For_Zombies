class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :zombie_id
      t.string :status

      t.timestamps
    end
    add_index :tweets, [:zombie_id, :created_at]
  end
end
