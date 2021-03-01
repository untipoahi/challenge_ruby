class ApiController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def index
    @urls = ::Url.latest
    @data = @urls.map do |url|
      {
        type: url.class.name,
        id: url.id,
        attributes: {
          'created-at': url.created_at,
          'original-url': url.original_url,
          url: 'http://domain/'+url.short_url,
          clicks: url.clicks_count
        },
        relations: {
          clicks: url.clicks.map do | click |
            {
              id: click.id,
              type: click.class.name,
              attributes: {
                'created-at': click.created_at,
                broser: click.browser,
                platform: click.platform
              }
            }
          end
        }
      }
    end
    render json: { message: @data }, status: :ok
  end
end