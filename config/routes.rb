# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#index'
  post 'recipient' => 'application#create_recipient', as: 'create_recipient'
  post 'payment' => 'application#create_payment', as: 'create_payment'
end
