class PatientsController < ApplicationController

  before_action :find_patient, only: [:show, :edit, :update, :destroy]


  def index
    # @patients = Patient.all
  if params[:doctor].blank?
    @patients = Patient.all.order("created_at DESC")
    else
    @doctor_id = Doctor.find_by(name: params[:doctor]).id
    @patients = Patient.where(category_id: @doctor_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "The patient was created!"
      redirect_to @patient
        else
          render 'new'
      end
   end

  def edit
  end

  def update
     if @patient.update(patient_params)
          flash[:success] = "The patient was updated"
          redirect_to @patient
     else
          render 'edit'
     end
   end
def destroy
   @patient.destroy
   flash[:success] = "The patient was destroyed"
   redirect_to root_path
 end

  private

  def patient_params
    params.require(:patient).permit(:name, :notes, :age, :oxygenlevel, :doctor_id)
  end


  def find_patient
    @patient = Patient.find(params[:id])
  end

end
