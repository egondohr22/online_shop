class ShippingAddressesController < ApplicationController
  before_action :set_shipping_address, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  # GET /shipping_addresses or /shipping_addresses.json
  def index
    @shipping_addresses = ShippingAddress.all
  end

  # GET /shipping_addresses/1 or /shipping_addresses/1.json
  def show
    redirect_to user_path(current_user.id)
  end

  # GET /shipping_addresses/new
  def new
    @shipping_address = ShippingAddress.new
  end

  # GET /shipping_addresses/1/edit
  def edit
  end

  # POST /shipping_addresses or /shipping_addresses.json
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)

    respond_to do |format|
      if @shipping_address.save
        format.html { redirect_to shipping_address_url(@shipping_address), notice: "Shipping address was successfully created." }
        format.json { render :show, status: :created, location: @shipping_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_addresses/1 or /shipping_addresses/1.json
  def update
    respond_to do |format|
      if @shipping_address.update(shipping_address_params)
        format.html { redirect_to shipping_address_url(@shipping_address), notice: "Shipping address was successfully updated." }
        format.json { render :show, status: :ok, location: @shipping_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_addresses/1 or /shipping_addresses/1.json
  def destroy
    @shipping_address.destroy

    respond_to do |format|
      format.html { redirect_to shipping_addresses_url, notice: "Shipping address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_address
      @shipping_address = ShippingAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_address_params
      params.require(:shipping_address).permit(:id, :street_address, :city, :state, :postal_code, :country)
    end
end
