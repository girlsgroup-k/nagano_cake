class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def check
  end

  def withdrawal
  end

  private
  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :post_code,
      :address,
      :phone_number,
      :email,
      :is_deleted
    )
  end
end