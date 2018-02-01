require 'rails_helper'

RSpec.describe "Shortens", type: :request do
  describe "GET /:shortcode" do
    
    context "when the record exists" do
      let!(:shorten) { Shorten.create(url: 'http://example.com', shortcode: 'example') }
      let(:shortcode) { shorten.shortcode }

      before { get "/#{shortcode}" }

      it "returns status 302" do
        expect(response).to have_http_status(302)
      end

      it "returns shorten's location" do
        expect(json['Location']).to eq('http://example.com')
      end
    end

    context "when the record does not exist" do
      let(:shortcode) { 'not_found' }

      before { get "/#{shortcode}" }

      it "returns status 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Data not found/)
      end

    end
  end
end
