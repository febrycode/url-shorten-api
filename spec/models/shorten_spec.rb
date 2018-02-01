require 'rails_helper'

RSpec.describe Shorten, type: :model do
  it "is invalid without a url" do
    shorten = Shorten.new(url: nil)

    expect(shorten).to_not be_valid
  end

  it "returns messages without a url" do
    shorten = Shorten.new(url: nil)

    shorten.valid?

    # shorten.errors[:url] is an array so use include insted match
    expect(shorten.errors[:url]).to include("can't be blank")
  end
end
