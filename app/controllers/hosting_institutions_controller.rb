class HostingInstitutionsController < ApplicationController
  before_action :set_hosting_institution, only: [:show, :edit, :update, :destroy]

  # GET /hosting_institutions
  def index
    @hosting_institutions = HostingInstitution.all
  end

  # GET /hosting_institutions/1
  def show
  end

  # GET /hosting_institutions/new
  def new
    @hosting_institution = HostingInstitution.new
  end

  # GET /hosting_institutions/1/edit
  def edit
  end

  # POST /hosting_institutions
  def create
    @hosting_institution = HostingInstitution.new(hosting_institution_params)

    if @hosting_institution.save
      redirect_to @hosting_institution, notice: 'Hosting institution was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hosting_institutions/1
  def update
    if @hosting_institution.update(hosting_institution_params)
      redirect_to @hosting_institution, notice: 'Hosting institution was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hosting_institutions/1
  def destroy
    @hosting_institution.destroy
    redirect_to hosting_institutions_url, notice: 'Hosting institution was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hosting_institution
      @hosting_institution = HostingInstitution.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hosting_institution_params
      params.require(:hosting_institution).permit(:institution, :address, :description, :contact_person, :contact_phone, :contact_email)
    end
end
