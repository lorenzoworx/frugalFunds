class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.group.find(params[:id])
    @products = @group.products
  end

  def new
    @group = Group.new
  end

  

end
