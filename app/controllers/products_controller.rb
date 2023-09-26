class ProductsController < ApplicationController

  def new
    @group = current_user.groups.find(params[:group_id])
    @product = Product.new
  end

end
