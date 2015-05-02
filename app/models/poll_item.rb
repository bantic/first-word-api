class PollItem < ActiveRecord::Base
  belongs_to :poll

  friendly_id :title, use: :slugged
end
