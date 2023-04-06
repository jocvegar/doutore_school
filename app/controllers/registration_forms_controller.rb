class RegistrationFormsController < ApplicationController
  before_action :authenticate_user!, except: %i[ edit update submitted not_found ]
  before_action :set_registration_form, only: %i[ edit update ]

  def index
    @registration_forms = RegistrationForm.where(submitted: true).order(updated_at: :desc)
  end

  def show; end

  def new
    @registration_form = RegistrationForm.new
  end

  def edit; end

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

  def update
    @registration_form.submitted = true
    respond_to do |format|
      if @registration_form.update(registration_form_params)
        StudentCreator.new(@registration_form).call
        format.html { redirect_to submitted_registration_forms_path, notice: "Registration form was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  def submitted; end

  def not_found; end

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
