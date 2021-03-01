# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Click, type: :model do
  describe 'validations' do
    url_id = Url.maximum(:id) || 0 + 1
    it 'validates url_id is valid' do
      a = Click.new(url_id: url_id, browser: 'test', platform: 'test')
      result = a.save
      expect(result).to be false
      expect(a.errors.messages[:url]).to include 'must exist'
    end

    it 'validates browser is not null' do
      url = Url.create(original_url: 'http://test.com')
      a = Click.new(url_id: url.id, platform: 'test')
      result = a.save
      expect(result).to be false
      expect(a.errors.messages[:browser]).to include 'can\'t be blank'
    end

    it 'validates platform is not null' do
      url = Url.create(original_url: 'http://test.com')
      a = Click.new(url_id: url.id, browser: 'test')
      result = a.save
      expect(result).to be false
      expect(a.errors.messages[:platform]).to include 'can\'t be blank'
    end
  end
end
