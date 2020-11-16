class PatientsController < ApplicationController

  before_action :find_patient, only: [:show, :edit, :update, :destroy]


  def index
  if params[:doctor].blank?
    @patient = Patient.all.order("created_at DESC")
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
             redirect_to @patient, notice: “The patient was created!”
        else
             render ‘new’
        end
   end

  def edit
  end

  def update
     if @patient.update(patient_params)
          redirect_to @patient, notice: “Update successful”
     else
          render ‘edit’
     end
end

def destroy
   @patient.destroy
   redirect_to root_path, notice: Patient destroyed”
end

  private

  def patient_params
    params.require(:patient).permit(:name, :notes, :age, :oxygenlevel, :doctor_id)
  end


  def find_patient
    @patient = Patient.find(params[:id])
  end
end
