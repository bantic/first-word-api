require 'rails_helper'

RSpec.describe Photo, :type => :model do
  it 'is valid from the factory' do
    expect(Fabricate.build(:photo)).to be_valid
  end

  describe '#image_url' do
    let(:photo) { Fabricate :photo }

    it 'has an image_url' do
      expect(photo.image_url).to be_present
    end
  end
end
