require 'oat/adapters/hal'

class PollItemSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type  'poll_item'

    map_properties :title, :slug
    property :id, item.slug

    entity :photo, item.photo, PhotoSerializer
  end
end
