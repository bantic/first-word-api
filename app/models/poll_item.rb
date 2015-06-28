class PollItem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :poll
  has_one :photo, dependent: :destroy

  def self.normalize_word(word)
    word.split(' ')[0].downcase.gsub(/[^a-z]+/, '')
  end

  def add_word word
    normalized_word = self.class.normalize_word(word)

    increment_list_item(normalized_word)
    increment_total_word_count
  end

  # Total count for all words for this poll_item
  def word_count
    (redis.get(word_count_key) || 0).to_i
  end

  # Array of tuples in desc order i.e. [ ["good", 3], ["great", 2] ]
  def sorted_words
    start = 0
    stop = -1 # all
    options = {with_scores: true}
    redis.zrevrange(word_list_key, start, stop, options)
  end

  private

  def increment_total_word_count
    redis.incr(word_count_key)
  end

  def increment_list_item(list_item)
    amount = 1
    redis.zincrby(word_list_key, amount, list_item)
  end

  def word_list_key
    "#{friendly_id}-word-list"
  end

  def word_count_key
    "#{friendly_id}-word-count"
  end

  def redis
    $redis
  end
end
