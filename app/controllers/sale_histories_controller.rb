class SaleHistoriesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def create
    orders = Order.where(user_id: current_user.id)
    sales = SalesHistory.new
    total = 0
    orders.each do |o|
      total = total + o.subtotal
    end
    total = total + 500
    sales.total = total
    sales.shipping_address_id = ShippingAddress.find_by(user_id: current_user.id).id
    binding.pry
    sales.order_id = orders.id
    sales.deleted = false
  end

  def change_status
  end

  def hidden
  end
end
