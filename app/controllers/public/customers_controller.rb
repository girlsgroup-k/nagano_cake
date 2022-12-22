class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def check
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = Customer.find_by(email: params[:email])
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
end