class HomeController < ApplicationController
    def new
        @products = Product.includes(:category).includes(image_attachment: :blob).all
        @products = @products.where("name LIKE ? OR description LIKE ?","%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?
        @products = @products.order(:price) if params[:price].present? && params[:price] == "Low to High"
        @products = @products.order(price: :desc) if params[:price].present? && params[:price] == "High to Low"


        @user = current_user
        if current_user.present?
            if @user.carts.nil?
                cart = Cart.create(user_id: @user.id)
                cart.save
                @user.carts = cart
            end
            @cart = @user.carts
        end


    end 
 end