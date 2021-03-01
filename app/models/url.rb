# frozen_string_literal: true

class Url < ApplicationRecord
  scope :latest, -> { order(:created_at).last(10) }
  validates :original_url, url: true
  has_many :clicks
  before_save :generate_short_url, unless: :short_url

  def generate_short_url
    @last_url = ::Url.order(:short_url).last
    if @last_url
      ::Alphabetify.seed_hash(@last_url.short_url)
      self.short_url = ::Alphabetify.generate_hash
    else
      self.short_url = 'AAAAA'
    end
  end

  def add_click!(click_data)
    if clicks.new(click_data).validate
      self.clicks_count = clicks.count
      save
    end
  end

  def clicks_by_day
    clicks.current_month.group('DATE(created_at)').count
  end

  def clicks_by_browser
    clicks.group(:browser).count
  end

  def clicks_by_platform
    clicks.group(:platform).count
  end
end
