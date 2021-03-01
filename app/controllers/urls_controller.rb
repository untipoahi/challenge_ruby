# frozen_string_literal: true
class UrlsController < ApplicationController
  def index
    # recent 10 short urls
    @url = ::Url.new
    @urls = ::Url.order(:created_at).last(10)
  end

  def create
    @url = ::Url.new(url_params)
    if @url.save
      redirect_to(@url)
    else

    end
  end

  def show
    @url = ::Url.find(params[:url])
    # implement queries
    @daily_clicks = [
      ['1', 13],
      ['2', 2],
      ['3', 1],
      ['4', 7],
      ['5', 20],
      ['6', 18],
      ['7', 10],
      ['8', 20],
      ['9', 15],
      ['10', 5]
    ]
    @browsers_clicks = [
      ['IE', 13],
      ['Firefox', 22],
      ['Chrome', 17],
      ['Safari', 7]
    ]
    @platform_clicks = [
      ['Windows', 13],
      ['macOS', 22],
      ['Ubuntu', 17],
      ['Other', 7]
    ]
  end

  def visit
    # params[:short_url]
    @url = ::Url.where(short_url: params[:short_url]).first
    unless @url
      redirect_to(errors_show_path(message: '404 - Url not found.'))
    else
      @url.clicks.new(browser: 'firefox',platform: 'linux')
      @url.save
      redirect_to(@url.original_url)
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
