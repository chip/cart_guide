class OrdersController < ApplicationController
  before_filter :get_cart
  
  def new
    unless logged_in?
      redirect_to login_url and return
    end
    @order = Order.new(params[:order] ||
      {     
        :card_type          => 'visa',
        :card_number        => '4569819806389761', # Login to Paypal Sandbox, view Personal account info
        :card_verification  => '444',
        :first_name         => 'Dean',
        :last_name          => 'Castle'
      }
    )
    @order.billing_address = BillingAddress.new(params[:billing_address])
    # @billing_address = BillingAddress.new(params)
    logger.info "total_price: #{@current_cart.total_price}"
    if @current_cart.total_price.zero?
      flash[:error] = "Please add items to your cart before attempting to complete an order."
      redirect_to cart_url(@current_cart) and return
    end
  end
  
  def create
    @order = current_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    @order.billing_address = BillingAddress.new(params[:billing_address])
    
    if @order.save
      # @billing_address.save
      if @order.purchase
        # Notifications.deliver_order(@order, @billing_address)
        Notifications.deliver_order(@order)
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end
