require 'rails_helper'

RSpec.describe Poll, :type => :model do
  it 'is valid from the factory' do
    expect(Fabricate.build(:poll)).to be_valid
  end

  it 'has a friendly id from the title' do
    poll = Fabricate(:poll, title: 'Democratic Candidates')
    expect(poll.friendly_id).to eq('democratic-candidates')
  end

  it '#key is the friendly id' do
    poll = Fabricate(:poll)
    expect(poll.key).to eq(poll.friendly_id)
  end
end
