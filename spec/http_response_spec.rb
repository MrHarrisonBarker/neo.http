require 'rspec'
require_relative '../lib/http_response'
require_relative '../lib/status_codes'
require_relative '../lib/header'

describe 'HttpResponse' do
  context 'when making response' do
    it 'should match section 6' do
      response = HttpResponse::new(StatusLine::new(StatusCodes::OK))
      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "\r", "\n"])
    end

    it 'should add header' do
      response = HttpResponse::new(StatusLine::new(StatusCodes::OK),[Header::new("key","value")])
      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "k", "e", "y", ":", " ", "v", "a", "l", "u", "e", "\r", "\n", "\r", "\n"])
    end
  end
end