# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    @url = ::Url.new
    @urls = ::Url.latest
  end

  def create
    @url = ::Url.new(url_params)
    if @url.save
      redirect_to(root_path)
    else
      redirect_to(controller: :errors, action: :show, message: 'Unexpected while shortening URL. Please try again later.')
    end
  end

  def show
    @url = ::Url.find(params[:url])
    @daily_clicks = @url.clicks_by_day.map { |h| [h[0].day, h[1]] }
    @browsers_clicks = @url.clicks_by_browser.map { |h| [h[0], h[1]] }
    @platform_clicks = @url.clicks_by_platform.map { |h| [h[0], h[1]] }
  rescue ::ActiveRecord::RecordNotFound
    redirect_to(controller: :errors, action: :show, message: '404 - Url does not exist.')
  end

  def visit
    @url = ::Url.where(short_url: params[:short_url]).first
    if @url
      @url.add_click!(browser: browser.name, platform: browser.platform.name)
      redirect_to(@url.original_url)
    else
      redirect_to(errors_show_path(message: '404 - Url not found.'))
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
