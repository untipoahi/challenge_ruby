# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validations' do
    it 'validates original URL is a valid URL' do
      url = Url.new(original_url: 'ufg:/this is invalid.m')
      result = url.save
      expect(result).to be false
      expect(url.errors.messages[:original_url]).to include 'is not a valid URL'
    end

    it 'validates short URL is present' do
      url = Url.create(original_url: 'http://valid.com')
      expect(url.short_url).not_to be_empty
    end

    # add more tests
  end
end
