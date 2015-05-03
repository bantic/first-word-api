class AddImageDisplayUidToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_display_uid, :string
  end
end
