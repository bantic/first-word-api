class AddPollItemIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :poll_item_id, :string
    add_index :photos, :poll_item_id
  end
end
