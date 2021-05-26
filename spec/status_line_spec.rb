require 'rspec'
require_relative '../lib/http_response'
require_relative '../lib/status_codes'

describe 'StatusLine' do
  context 'when making status line' do
    it 'should match section 6.1' do
      status_line = StatusLine::new(StatusCodes::OK)
      expect(status_line.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n"])
    end
  end

  context 'when parsing' do
    it 'should return valid' do
      input_s     = "HTTP/1.1\x20200\x20\r\n"
      status_line = StatusLine.parse(input_s)
      expect(status_line.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "\r", "\n"]);
    end

    it 'should have phrase' do
      input_s     = "HTTP/1.1\x20200\x20this is a reason\r\n"
      status_line = StatusLine.parse(input_s)
      expect(status_line.to_s.chars).to eq(["H", "T", "T", "P", "/", "1", ".", "1", " ", "2", "0", "0", " ", "t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "r", "e", "a", "s", "o", "n", "\r", "\n"])
    end
  end
end