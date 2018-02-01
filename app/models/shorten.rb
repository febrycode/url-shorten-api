class Shorten < ApplicationRecord
  validates :url, presence: true
end
