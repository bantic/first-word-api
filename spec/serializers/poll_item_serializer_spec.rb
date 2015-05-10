require 'rails_helper'

RSpec.describe PollItemSerializer, :type => :serializer do
  let(:poll_item) { Fabricate(:poll_item, poll: Fabricate(:poll)) }
  let(:serializer) { PollItemSerializer.new(poll_item) }
  let(:serialized) { serializer.to_hash }

  context 'top-level' do
    subject { serialized }
    its(:keys) { should include(:title) }
    its(:keys) { should include(:slug) }
    its(:keys) { should include(:_embedded) }
    its(:keys) { should include(:id) }
    its([:id]) { is_expected.to eq(poll_item.slug) } 
  end

  context 'embedded' do
    subject { serialized[:_embedded] }
    its(:keys) { should include(:photo) }

    context 'photo' do
      subject { serialized[:_embedded][:photo] }
      its(:keys) { should include(:image_url) }
    end
  end
end
