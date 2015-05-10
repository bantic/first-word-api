class Api::PollsController < ApiController
  def index
    @polls = Poll.all
    render json: PollCollectionSerializer.new(@polls)
  end
end
