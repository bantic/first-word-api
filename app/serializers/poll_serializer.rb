require 'oat/adapters/hal'

class PollSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type  'poll'

    map_properties :title, :slug
    property :id, item.slug

    entities :poll_items, item.poll_items, PollItemSerializer
  end
end
