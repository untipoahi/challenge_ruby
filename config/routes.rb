# frozen_string_literal: true

Rails.application.routes.draw do
  get 'errors/show'
  get 'api/clicks', to: 'api#index'
  root to: 'urls#index'

  resources :urls, only: %i[index create show], param: :url
  get ':short_url', to: 'urls#visit', as: :visit
end
