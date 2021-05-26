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
end