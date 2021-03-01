require 'rails_helper'
require 'webdrivers'

RSpec.describe 'Short Urls', type: :system do
  before do
    driven_by :selenium, using: :headless_firefox
  end

  it 'shows a list of short urls' do
    visit '/'
    expect(page).to have_text('HeyURL!')
  end

  it 'shows a panel of stats for a given short url' do
    visit '/'
  end

  describe 'creating a new short url' do
    context 'when url is valid' do
      it 'creates the short url' do
        visit '/'
      end

      it 'redirects to the home page' do
        visit '/'
      end
    end

    context 'when url is invalid' do
      it 'does not create the short url and shows a message' do
        visit '/'
      end

      it 'redirects to the home page' do
        visit '/'
      end
    end
  end

  describe 'clicking a short url' do
    it 'redirects the user to the original url' do
      visit '/'
    end
  end
end

# I checked that all theee tests are not finished
