require 'rspec'
require_relative '../lib/http_request'
require_relative '../lib/methods'

describe 'HttpRequest' do
  context 'when making request' do
    it 'should match section 5' do
      request = HttpRequest::new(Methods::GET, "/", false)
      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n"])
    end

    it 'headers should be present' do
      request = HttpRequest::new(Methods::GET, "/", false)
      request.add_header(Header::new("key", "val"))
      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "k", "e", "y", ":", " ", "v", "a", "l", "\r", "\n", "\r", "\n"])
    end
  end
end