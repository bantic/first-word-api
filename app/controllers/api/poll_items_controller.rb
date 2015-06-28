class Api::PollItemsController < ApiController
  def show
    @poll_item = PollItem.friendly.find params[:id]
    render json: JSONAPI::Serializer.serialize(@poll_item, include: ['photo'])
  end
end
