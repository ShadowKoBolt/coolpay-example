# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :find_currencies

  def index
    @recipients = coolpay_client.recipients
    @payments = coolpay_client.payments
  end

  def create_recipient
    coolpay_client.create_recipient(name: params[:name])
    redirect_to root_path
  end

  def create_payment
    coolpay_client.create_payment(
      recipient_id: params[:recipient_id],
      currency: params[:currency],
      amount: params[:amount]
    )
    redirect_to root_path
  end

  private

  def coolpay_client
    @coolpay_client ||= Coolpay::Client.new(
      username: ENV['COOLPAY_USERNAME'],
      api_key: ENV['COOLPAY_API_KEY']
    )
  end

  def find_currencies
    @currencies = Coolpay::CURRENCIES
  end
end
