class CreatePollItems < ActiveRecord::Migration
  def change
    create_table :poll_items do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :poll_id, null: false

      t.timestamps null: false
    end

    add_index :poll_items, :poll_id
  end
end
