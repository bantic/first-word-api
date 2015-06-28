class PollItemSerializer < BaseSerializer
  attribute :title
  attribute :slug
  attribute :sorted_words

  has_one :photo

  def id
    object.slug
  end
end
