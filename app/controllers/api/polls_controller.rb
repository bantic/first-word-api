class Api::PollsController < ApiController
  def index
    @polls = Poll.all
    render json: JSONAPI::Serializer.serialize(@polls, is_collection: true, include: ['poll-items', 'poll-items.photo'])
  end
end
