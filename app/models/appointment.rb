class Appointment < ApplicationRecord
	belongs_to :user
	scope :filter_doctor, -> (user) { user.doctor? ? where(user: user).order(slot: :desc) : order(slot: :asc) } 
end
