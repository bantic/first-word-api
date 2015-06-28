class PollSerializer < BaseSerializer
  attribute :title
  attribute :slug

  def id
    object.slug
  end

  has_many :poll_items
end
