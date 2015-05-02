class Poll < ActiveRecord::Base
  # http://norman.github.io/friendly_id/file.Guide.html
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :poll_items, dependent: :destroy
end
