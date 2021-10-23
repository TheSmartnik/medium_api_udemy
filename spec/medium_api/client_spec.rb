require 'spec_helper'

RSpec.describe MediumApi::Client do
  subject(:client) { described_class.new(api_key: api_key) }
  let(:api_key) { '2ada46c383ae76af4ca4dcbe42f7611062644f366bd6281c2efe78202b35f3c60' }

  describe '#me' do
    specify do
      me = VCR.use_cassette 'me' do
        client.me
      end

      expect(me['name']).to eq('Test Api Key')
    end
  end
end
