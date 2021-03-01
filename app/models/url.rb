# frozen_string_literal: true

class Url < ApplicationRecord
  # scope :latest, -> {}
  has_many :clicks
  before_save :generate_short_url

  def generate_short_url
    @last_url = ::Url.order(:created_at).last
    unless @last_url
      self.short_url = 'AAAAA'
    else
      ::Alphabetify.seed_hash(@last_url.short_url)
      self.short_url = ::Alphabetify.generate_hash
    end
  end
end
