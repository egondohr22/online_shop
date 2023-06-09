class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:show, :create, :index]
  before_action :set_order, only: %i[ show edit update destroy ]



  # GET /orders or /orders.json
  def index
    if current_user.role == "admin"
      @orders = Order.includes(:product, :user).all
    else
      @orders = Order.includes(:product, :user).where user_id: current_user.id
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    unless current_user.role == "admin"
      if(@order.user_id == current_user.id)
        render :show
      else
        @orders = Order.includes(:product, :user).where user_id: current_user.id
        render :index
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    product = @order.product
    respond_to do |format|
      if product.stock > 0 && @order.save
        product.update(stock: product.stock-1)
        OrderMailer.send_email(current_user, @order).deliver_now
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to root_path, notice: "Order was not created." }

        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to edit_order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:id, :user_id, :product_id, :status, :tracking_number, :quantity)

    end
end
