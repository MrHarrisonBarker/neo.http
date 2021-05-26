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
      response = HttpResponse::new(StatusLine::new(StatusCodes::OK), [Header::new("key", "value")])
      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "k", "e", "y", ":", " ", "v", "a", "l", "u", "e", "\r", "\n", "\r", "\n"])
    end
  end

  context "when parsing" do
    it 'should be valid' do
      input_lines = ["HTTP/1.1\x20200\x20\r\n", "\r\n"]
      response    = HttpResponse.parse(input_lines)

      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "\r", "\n"])
      expect(response).to be_kind_of(HttpResponse)
    end

    it 'should have headers' do
      input_lines = ["HTTP/1.1\x20200\x20\r\n", "key: val\r\n", "\r\n"]
      response    = HttpResponse.parse(input_lines)

      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "k", "e", "y", ":", " ", " ", "v", "a", "l", "\r", "\n", "\r", "\n"])
      expect(response).to be_kind_of(HttpResponse)
    end

    it 'should have message' do
      input_lines = ["HTTP/1.1\x20200\x20\r\n", "\r\n", "Message"]
      response    = HttpResponse.parse(input_lines)

      expect(response.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n", "\r", "\n", "M", "e", "s", "s", "a", "g", "e"])
      expect(response).to be_kind_of(HttpResponse)
    end

    it 'should have everything' do

    end
  end
end