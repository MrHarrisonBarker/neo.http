require 'rspec'
require_relative '../lib/message'
require_relative '../lib/header'

describe 'Message' do

  context 'when adding header' do
    it 'should add' do
      message = Message::new(nil)
      message.add_header(Header::new("key", "val"))
      expect(message.to_s.chars).to eq(["k", "e", "y", ":", " ", "v", "a", "l", "\r", "\n", "\r", "\n"])
    end

    it 'should add and format multiple' do
      message = Message::new(nil)
      message.add_header(Header::new("key", "val"))
      message.add_header(Header::new("anotherKey", "anotherVal"))
      expect(message.to_s.chars).to eq(["k", "e", "y", ":", " ", "v", "a", "l", "\r", "\n", "a", "n", "o", "t", "h", "e", "r", "K", "e", "y", ":", " ", "a", "n", "o", "t", "h", "e", "r", "V", "a", "l", "\r", "\n", "\r", "\n"])
    end
  end
end