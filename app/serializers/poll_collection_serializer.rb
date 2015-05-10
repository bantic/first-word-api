require 'oat/adapters/hal'

class PollCollectionSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type  'polls'
    collection :polls, item, PollSerializer
  end
end
