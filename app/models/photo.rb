class Photo < ActiveRecord::Base
  belongs_to :poll_item

  dragonfly_accessor :image do
    copy_to(:image_display) {|i| i.thumb('152x152#') }
  end
  dragonfly_accessor :image_display

  def image_url
    image_display && image_display.remote_url
  end
end
