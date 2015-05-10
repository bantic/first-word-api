require 'rails_helper'

RSpec.describe PhotoSerializer, :type => :serializer do
  let(:photo) { Fabricate(:photo) }
  let(:serializer) { PhotoSerializer.new(photo) }
  let(:serialized) { serializer.to_hash }

  context 'top-level' do
    subject { serialized }
    its(:keys) { should include(:image_url) }
    its(:keys) { should include(:id) }
  end
end
