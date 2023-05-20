class UsersController < ApplicationController
  before_action :chek_admin

  def index
    @users = User.all
  end
end
