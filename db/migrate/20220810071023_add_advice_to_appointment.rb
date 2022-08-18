class AddAdviceToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :advice, :string
  end
end
