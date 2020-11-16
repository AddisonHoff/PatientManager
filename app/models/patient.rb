class Patient < ApplicationRecord
  belongs_to :doctor
  validates :name, :notes, :age, :oxygenlevel, :doctor_id, presence: true
end
