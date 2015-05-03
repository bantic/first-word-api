class Photo < ActiveRecord::Base
  dragonfly_accessor :image do
    copy_to(:image_display) {|i| i.thumb('152x152#') }
  end
  dragonfly_accessor :image_display
end
