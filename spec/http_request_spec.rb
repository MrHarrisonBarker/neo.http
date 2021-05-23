require 'rspec'
require_relative '../lib/http_request'
require_relative '../lib/methods'

describe 'HttpRequest' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when making request' do
    it 'should match section 5' do
      request = HttpRequest::new(Methods::GET, "/", false)
      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "1", ".", "1", "\r", "\n", "\r", "\n"])
    end
  end
end