# frozen_string_literal: true
require "browser"
class Click < ApplicationRecord
  scope :current_month, -> { where('created_at > ?', ::Date.current.beginning_of_month) }
  validates_presence_of :browser, :platform
  belongs_to :url
end
