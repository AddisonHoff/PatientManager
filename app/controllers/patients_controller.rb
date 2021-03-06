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
    respond_to do |format|
         if @patient.save
           format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
           format.json { render :show, status: :created, location: @patient }
         else
           format.html { render :new }
           format.json { render json: @patient.errors, status: :unprocessable_entity }
         end
       end
     end

  def edit
  end

  def update
    respond_to do |format|
      if @patient.update(post_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @patient.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Patient was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  

  private

  def patient_params
    params.require(:patient).permit(:name, :notes, :age, :oxygenlevel, :doctor_id)
  end


  def find_patient
    @patient = Patient.find(params[:id])
  end

end
