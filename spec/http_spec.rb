require 'rspec'
require_relative '../lib/http'
require_relative '../lib/uri'

describe 'Http' do
  context 'when getting' do
    it 'should return request' do
      request = Http::new::get(URI::new("/"))
      expect(request).to be_kind_of(HttpRequest)
    end
  end

  context "when posting" do
    it 'should return request' do
      request = Http::new::post(URI::new("/posts"), "body")
      expect(request).to be_kind_of(HttpRequest)
    end
  end

  context "when putting" do
    it 'should return request' do
      request = Http::new::put(URI::new("/"), "")
      expect(request).to be_kind_of(HttpRequest)
    end
  end

  context "when deleting" do
    it 'should return request' do
      request = Http::new::delete(URI::new("/"))
      expect(request).to be_kind_of(HttpRequest)
    end
  end
end