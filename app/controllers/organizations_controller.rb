class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:edit, :update]
  def index
    @organizations = Organization.all
  end

  def new
    @form = OrganizationRegistrationForm.new
  end

  def create
    @form = OrganizationRegistrationForm.new(attributes: organization_params)
    if @form.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @form = OrganizationRegistrationForm.new(organization: @organization)
  end

  def update
    @form = OrganizationRegistrationForm.new(organization: @organization, attributes: organization_params)
    if @form.save
      redirect_to :index
    else
      render :edit
    end
  end

  def show
  end

  def destroy
  end

  private

  def organization_params
    params.require(:organization_registration_form).permit(:name, :address, :url, :user_emails)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
