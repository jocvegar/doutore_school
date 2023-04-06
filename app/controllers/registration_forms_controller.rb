class RegistrationFormsController < ApplicationController
  before_action :set_registration_form, only: %i[ show edit update destroy ]

  # GET /registration_forms or /registration_forms.json
  def index
    @registration_forms = RegistrationForm.all
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
    @registration_form = RegistrationForm.new(registration_form_params)

    respond_to do |format|
      if @registration_form.save
        format.html { redirect_to registration_form_url(@registration_form), notice: "Registration form was successfully created." }
        format.json { render :show, status: :created, location: @registration_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registration_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_forms/1 or /registration_forms/1.json
  def update
    respond_to do |format|
      if @registration_form.update(registration_form_params)
        format.html { redirect_to registration_form_url(@registration_form), notice: "Registration form was successfully updated." }
        format.json { render :show, status: :ok, location: @registration_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registration_form.errors, status: :unprocessable_entity }
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
      @registration_form = RegistrationForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registration_form_params
      params.require(:registration_form).permit(:first_name, :last_name, :email, :date_of_birth, :submitted, :slug)
    end
end
