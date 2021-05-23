require 'rspec'
require_relative '../lib/http_request'
require_relative '../lib/methods'

describe 'RequestLine' do

  context 'when making request line' do
    it 'should match section 5.1' do
      request_line = RequestLine::new(Methods::GET, "/")
      expect(request_line.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "1", ".", "1", "\r", "\n"])
    end
  end

end