require 'rspec'
require_relative '../lib/http'
require_relative '../lib/uri'

describe 'Http' do
  context 'when getting' do
    it 'should return request' do
      request = Http::new::get(URI::new("/"))
      expect(request).to be_kind_of(HttpRequest)
    end
  end
end