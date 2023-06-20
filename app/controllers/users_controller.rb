class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin, except: [:show, :update]

  def index
    @users = User.all
  end

  def show
    
    @user = current_user
    if @user.shipping_address.nil?
      address = ShippingAddress.create(user_id: @user.id)
      address.save
      @user.shipping_address = address
    end
    if @user.billing_address.nil?
      address = BillingAddress.create(user_id: @user.id)
      address.save
      @user.billing_address = address
    end

    @shipping_address = @user.shipping_address
    @billing_address = @user.billing_address

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :profilepic, :address_line1, :address_line2, :postcode, :country, :state_region, :mobile_number)
    end
end
