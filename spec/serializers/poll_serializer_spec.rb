require 'rails_helper'

RSpec.describe PollSerializer, :type => :serializer do
  let(:poll) { Fabricate(:poll) }

  # FIXME It should be possible for the poll fabricator to specify 2 poll items
  # and the poll_item fabricator to specify poll, but doing so causes an infinite recursive loop
  before { poll.poll_items << Fabricate(:poll_item, poll:poll) }

  let(:serializer) { PollSerializer.new(poll) }
  let(:serialized) { serializer.to_hash }

  context 'top-level' do
    subject { serialized }
    its(:keys) { should include(:title) }
    its(:keys) { should include(:slug) }
    its(:keys) { should include(:_embedded) }
    its(:keys) { should include(:id) }
    its([:id]) { is_expected.to eq(poll.slug) } 
  end

  context 'embedded poll_items' do
    let(:_embedded) { serialized[:_embedded] }
    subject { _embedded }
    its(:keys) { should include(:poll_items) }

    context 'poll_items[0]' do
      let(:embedded_poll_item) { _embedded[:poll_items][0] }
      subject { embedded_poll_item }
      its(:keys) { should include(:title) }
      its(:keys) { should include(:slug) }
      its(:keys) { should include(:_embedded) }

      context 'embedded photo' do
        subject { embedded_poll_item[:_embedded][:photo] }
      end
    end
  end
end
