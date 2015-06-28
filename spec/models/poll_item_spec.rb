require 'rails_helper'

RSpec.describe PollItem, :type => :model do
  it 'is valid from the factory' do
    expect(Fabricate.build(:poll_item)).to be_valid
  end

  it 'has a friendly id from the title' do
    poll_item = Fabricate(:poll_item, title: 'Edward Snowden')
    expect(poll_item.friendly_id).to eq('edward-snowden')
  end

  context '#normalize_word' do
    it 'lowercases a word' do
      expect(PollItem.normalize_word('ABCdefGHI')).to eq('abcdefghi')
    end

    it 'drops characters after the first space' do
      expect(PollItem.normalize_word('abc def ghi')).to eq('abc')
    end
  end

  context 'adding a word' do
    let(:poll_item) { Fabricate :poll_item }
    let(:poll) { poll_item.poll }
    let(:other_poll_item) { Fabricate :poll_item, poll:poll }
    let(:word) { Faker::Lorem.word }

    it 'returns a desc-sorted list' do
      word1 = PollItem.normalize_word('Abc')
      word2 = PollItem.normalize_word('Def')
      poll_item.add_word word1
      poll_item.add_word word2
      poll_item.add_word word1

      expect(poll_item.sorted_words).to eq([[word1, 2], [word2, 1]])
    end

    it 'normalizes words' do
      word1 = 'Abc'
      normalized_word1 = PollItem.normalize_word(word1)

      # precond
      expect(word1).not_to eq(normalized_word1)

      poll_item.add_word word1
      expect(poll_item.sorted_words).to eq([[normalized_word1, 1]])
    end

    it 'normalizes non-alpha chars' do
      # remove punctuation
      expect(PollItem.normalize_word('abc!')).to eq('abc')

      # remove numbers
      expect(PollItem.normalize_word('abc123')).to eq('abc')
    end

    it 'increments total word count' do
      # precond
      expect(poll_item.word_count).to eq(0)

      poll_item.add_word word
      expect(poll_item.word_count).to eq(1)

      poll_item.add_word word
      expect(poll_item.word_count).to eq(2)
    end

    it 'tracks words by poll item' do
      expect(poll_item.word_count).to eq(0)
      expect(poll_item.sorted_words.length).to eq(0)

      expect(other_poll_item.word_count).to eq(0)
      expect(other_poll_item.sorted_words.length).to eq(0)

      poll_item.add_word word

      expect(poll_item.word_count).to eq(1)
      expect(poll_item.sorted_words.length).to eq(1)

      expect(other_poll_item.word_count).to eq(0)
      expect(other_poll_item.sorted_words.length).to eq(0)
    end
  end
end
