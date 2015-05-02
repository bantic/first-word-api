class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end

    add_index :polls, :slug, unique: true
  end
end
