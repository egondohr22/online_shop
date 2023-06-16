class HomeController < ApplicationController
    def new
        @products = Product.includes(:category).includes(image_attachment: :blob).all
        @products = @products.where("name LIKE ? OR description LIKE ?","%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?
        @products = @products.order(:price) if params[:price].present? && params[:price] == "Low to High"
        @products = @products.order(price: :desc) if params[:price].present? && params[:price] == "High to Low"
    end 
 end