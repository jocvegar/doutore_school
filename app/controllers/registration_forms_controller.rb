class RegistrationFormsController < ApplicationController
  before_action :authenticate_user!, except: %i[ edit update submitted not_found ]
  before_action :set_registration_form, only: %i[ edit update ]

  # GET /registration_forms or /registration_forms.json
  def index
    @registration_forms = RegistrationForm.where(submitted: true).order(updated_at: :desc)
  end

  # GET /registration_forms/1 or /registration_forms/1.json
  def show
  end

  # GET /registration_forms/new
  def new
    @registration_form = RegistrationForm.new
  end

  # GET /registration_forms/1/edit
  def edit
  end

  # POST /registration_forms or /registration_forms.json
  def create
    @registration_form = RegistrationForm.new

    respond_to do |format|
      if @registration_form.save
        format.html { redirect_to registration_form_url(@registration_form), notice: "Registration form was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_forms/1 or /registration_forms/1.json
  def update
    @registration_form.submitted = true
    respond_to do |format|
      if @registration_form.update(registration_form_params)
        format.html { redirect_to submitted_registration_forms_path, notice: "Registration form was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_forms/1 or /registration_forms/1.json
  def destroy
    @registration_form.destroy

    respond_to do |format|
      format.html { redirect_to registration_forms_url, notice: "Registration form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_form
      @registration_form = RegistrationForm.find_by(slug: params[:id])

      if @registration_form.nil?
        redirect_to not_found_registration_forms_path
      elsif @registration_form.submitted == true
        redirect_to submitted_registration_forms_path
      end
    end

    # Only allow a list of trusted parameters through.
    def registration_form_params
      params.require(:registration_form).permit(:first_name, :last_name, :email, :date_of_birth)
    end
end
