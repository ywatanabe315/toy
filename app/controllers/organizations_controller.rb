class OrganizationsController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :url)
  end
end
