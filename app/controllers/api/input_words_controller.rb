class Api::InputWordsController < ApiController
  def create
    word = attributes[:word]
    if !poll_item
      # 404
    end
    poll_item.add_word word

    render nothing: true, status: 204
  end

  private

  def data
    params[:data] || {}
  end

  def attributes
    data[:attributes] || {}
  end

  def poll_item_id
    data[:relationships][:"poll-item"][:data][:id]
  rescue NoMethodError # missing one of the nested data fields
    nil
  end

  def poll_item
    @poll_item ||= begin
      PollItem.friendly.find poll_item_id
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
