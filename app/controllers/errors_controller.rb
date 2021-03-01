class ErrorsController < ApplicationController
  def show
    @message = params[:message]
  end
end
