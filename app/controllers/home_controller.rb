class HomeController < ApplicationController
    def new
        @products = Product.includes(:category).includes(image_attachment: :blob).all
    end 
 end