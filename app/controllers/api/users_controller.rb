class Api::UsersController < ApplicationController
  def index
    p "Hello"
    render :action => :index
    generate_client_token

    #put paypal here
    # ping paypal, paste in their code
    # p out stuff to verify that it's working
  end

  def create
    p "In create"
    p "params: #{params}"
  end

  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end

