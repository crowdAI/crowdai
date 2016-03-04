# == Schema Information
#
# Table name: hosting_institutions
#
#  id             :integer          not null, primary key
#  institution    :string
#  address        :text
#  description    :text
#  contact_person :string
#  contact_phone  :string
#  contact_email  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class HostingInstitutionsController < ApplicationController
  before_action :set_hosting_institution, only: [:show, :edit, :update, :destroy]

  def index
    @hosting_institutions = HostingInstitution.all
  end

  def show
    @competitions = Competition.where(hosting_institution: @hosting_institution)
  end

  def new
    @hosting_institution = HostingInstitution.new
  end

  def edit
  end

  def create
    @hosting_institution = HostingInstitution.new(hosting_institution_params)

    if @hosting_institution.save
      current_user.hosting_institution = @hosting_institution
      current_user.save!
      redirect_to @hosting_institution, notice: "The request to host competitions has been submitted. After review, you will be notified when #{@hosting_institution.institution} may begin to host competitions."
    else
      render :new
    end
  end

  def update
    if @hosting_institution.update(hosting_institution_params)
      redirect_to @hosting_institution, notice: 'Hosting institution was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hosting_institution.destroy
    redirect_to hosting_institutions_url, notice: 'Hosting institution was successfully destroyed.'
  end

  private
    def set_hosting_institution
      @hosting_institution = HostingInstitution.find(params[:id])
    end

    def hosting_institution_params
      params.require(:hosting_institution).permit(:institution, :address, :description, :approved, :hosting_institution_id, :status)
    end
end
