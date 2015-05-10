require 'oat/adapters/hal'

class PhotoSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type  'photo'

    map_properties :id, :image_url
  end
end
