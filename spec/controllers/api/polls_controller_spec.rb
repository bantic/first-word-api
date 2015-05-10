require 'rails_helper'

RSpec.describe Api::PollsController, :type => :controller do
  let!(:polls) { [poll1, poll2] }
  let(:poll1) { Fabricate(:poll) }
  let(:poll2) { Fabricate(:poll) }

  describe "#index" do
    before { get :index }
    let(:parsed_json) { JSON.parse(response.body).deep_symbolize_keys! }
    subject { parsed_json }

    its(:keys) { should include(:_embedded) }

    context 'embedded' do
      subject { parsed_json[:_embedded] }
      its(:keys) { should include(:polls) }

      it { expect(subject[:polls].length).to eq(polls.length) }
    end
  end
end
