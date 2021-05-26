require 'rspec'
require_relative '../lib/uri'

describe 'URI' do
  context 'when making URI' do
    it 'should return path' do
      uri = URI::new("localhost")
      expect(uri.to_s).to eq("localhost");
    end
  end
end