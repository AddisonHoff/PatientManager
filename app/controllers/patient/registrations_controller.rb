# frozen_string_literal: true

class Patient::RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:patient).permit(:email, :password, :password_confirmation, :name, :notes, :age, :oxygenlevel, :doctor_id)
  end

  def account_update_params

  params.require(:user).permit(:name,  :email, :password, :password_confirmation, :current_password)

end


end
