require 'rspec'
require_relative '../lib/header'

describe 'Header' do

  context 'when given nil value' do
    header = Header::new nil, nil

    it 'returns no header' do
      expect(header.to_s).to eq(nil)
    end
  end
  
  context 'when given key and value' do
    header = Header::new "Accept", "*/*"

    it 'should match section 4.2' do
      expect(header.to_s.chars).to eq(%w[A c c e p t : * / *])
    end
  end

end