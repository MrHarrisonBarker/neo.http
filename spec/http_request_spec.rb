require 'rspec'
require_relative '../lib/http_request'
require_relative '../lib/methods'

describe 'HttpRequest' do
  context 'when making request' do
    it 'should match section 5' do
      request = HttpRequest::new(Methods::GET, "/", "", [], false)

      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n"])
    end

    it 'headers should be present' do
      request = HttpRequest::new(Methods::GET, "/", "", [], false)
      request.add_header(Header::new("key", "val"))

      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "k", "e", "y", ":", " ", "v", "a", "l", "\r", "\n", "\r", "\n"])
    end

    it 'should post' do
      request = HttpRequest::new(Methods::POST, "/", "", [], false)

      expect(request.to_s.chars).to eq(["P", "O", "S", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n"])
    end

    it 'should have body' do
      request = HttpRequest::new(Methods::POST, "/", "", [], false)
      request.add_body("Message body")

      expect(request.to_s.chars).to eq(["P", "O", "S", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n", "M", "e", "s", "s", "a", "g", "e", " ", "b", "o", "d", "y"])
    end

    it 'should have multi line body' do
      request = HttpRequest::new(Methods::POST, "/", "", [], false)
      request.add_body("Message body\nNext line")

      expect(request.to_s.chars).to eq(["P", "O", "S", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n", "M", "e", "s", "s", "a", "g", "e", " ", "b", "o", "d", "y", "\n", "N", "e", "x", "t", " ", "l", "i", "n", "e"])
    end
  end

  context "when parsing" do
    it 'should be valid' do
      input_lines = ["GET\x20/\x20HTTP/1.1\r\n", "\r\n"]
      request     = HttpRequest.parse(input_lines)

      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n"])
      expect(request).to be_kind_of(HttpRequest)
      expect(request._start_line._method).to eq(Methods::GET)
    end

    it 'should have headers' do
      input_lines = ["GET\x20/\x20HTTP/1.1\r\n", "key: value\r\n", "\r\n"]
      request     = HttpRequest.parse(input_lines)

      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "k", "e", "y", ":", " ", "v", "a", "l", "u", "e", "\r", "\n", "\r", "\n"])
      expect(request).to be_kind_of(HttpRequest)
      expect(request._start_line._method).to eq(Methods::GET)
    end

    it 'should have body' do
      input_lines = ["POST\x20/\x20HTTP/1.1\r\n", "\r\n", "Message body"]
      request     = HttpRequest.parse(input_lines)

      expect(request.to_s.chars).to eq(["P", "O", "S", "T", " ", "/", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n", "M", "e", "s", "s", "a", "g", "e", " ", "b", "o", "d", "y"])
      expect(request).to be_kind_of(HttpRequest)
      expect(request._start_line._method).to eq(Methods::POST)
      expect(request._message_body).to eq("Message body")
    end

    it 'should have request uri' do
      input_lines = ["GET\x20/posts/all\x20HTTP/1.1\r\n", "\r\n"]
      request     = HttpRequest.parse(input_lines)

      expect(request.to_s.chars).to eq(["G", "E", "T", " ", "/", "p", "o", "s", "t", "s", "/", "a", "l", "l", " ", "H", "T", "T", "P", "/", "1", ".", "1", "\r", "\n", "\r", "\n"])
      expect(request).to be_kind_of(HttpRequest)
      expect(request._start_line._method).to eq(Methods::GET)
      expect(request._start_line._request_uri).to eq("/posts/all")
    end
  end
end