require 'spec_helper'

describe OmniAuth::Strategies::Imgur do
  context "client options" do
    subject do
      OmniAuth::Strategies::Imgur.new({})
    end

    it "should have the correct site" do
      expect(subject.options.client_options.site).to eq('https://api.imgur.com')
    end

    it "should have the correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq('https://api.imgur.com/oauth2/authorize')
    end

    it "should have the correct token url" do
      expect(subject.options.client_options.token_url).to eq('https://api.imgur.com/oauth2/token')
    end
  end
end
