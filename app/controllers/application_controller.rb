# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  def browser
    @browser ||= ::Browser.new(
      request.headers['User-Agent'],
      accept_language: request.headers['Accept-Language']
    )
  end
end
