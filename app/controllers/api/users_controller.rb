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

    user = User.new({:email => params[:email]})
    user.save

    p "user id: #{user.id}"

    result = Braintree::Customer.create(
      :email => params[:email],
      :id => user.id,
      :payment_method_nonce => params[:payment_method_nonce]
    )

    p "result: #{result}"
    render "api/users/thank_you"

  end

  def charge
    p "In charge: params: #{params}"

    result = Braintree::Transaction.sale(
      :amount => ".01",
      :customer_id => params[:id],
      :options => {
          :submit_for_settlement => true
      }
    )
  end


  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end

