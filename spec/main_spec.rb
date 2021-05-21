require 'rspec'
require "main"

describe 'Main' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'succeeds' do
      expect(Main.new(10).something).to eq(10)
    end
  end
end