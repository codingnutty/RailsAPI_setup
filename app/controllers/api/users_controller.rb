class Api::UsersController < ApplicationController
  def index
    p "Hello"
    @client_token = generate_client_token
    render :action => :index

    #put paypal here
    # ping paypal, paste in their code
    # p out stuff to verify that it's working
  end

  def new
    @client_token = generate_client_token
  end

  def create
    p "In create"
    p "params: #{params}"


    # @result =  Braintree::Transaction.sale(
    #   amount: "0.005",
    #   payment_method_nonce: params[:payment_method_nonce],
    #               customer: {
    #                 # first_name: params[:first_name],
    #                 # last_name: params[:last_name],
    #                 email: params[:email],
    #               },
    #               options: {
    #                 store_in_vault: true
    #               })
  end



  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end

