require 'spec_helper'

RSpec.describe MediumApi::Utils do
  describe '.underscore_keys' do
    let(:hash) { { imageUrl: 'something', superPublicationId: 123 } }
    let(:expected_hash) { { image_url: 'something', super_publication_id: 123 } }

    specify do
      expect(described_class.underscore_keys(hash)).to eq(expected_hash)
    end
  end

  describe '.underscore' do
    let(:string) { 'imageUrl' }
    let(:expected_string) { 'image_url' }

    specify do
      expect(described_class.underscore(string)).to eq(expected_string)
    end
  end
end
