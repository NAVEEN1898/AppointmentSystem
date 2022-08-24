class Appointment < ApplicationRecord
  belongs_to :counsellar, class_name: 'User', foreign_key: 'counsellar_id'
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'

  def availability(st, et)
    time(st, et)
  end

  def time(start_time, end_time)
    start_time = start_time.to_datetime.strftime('%H')
    end_time = end_time.to_datetime.strftime('%H')
    total_availability = Array(start_time..end_time)
    appointment = Appointment.where(appointment_date: Date.today.all_day).pluck(:appointment_date)
    total_appointment = appointment.map { |n| n.strftime('%H') }
    available = total_availability - total_appointment
    return available
  end
end
