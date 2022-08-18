class AddTimeToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :time, :datetime
  end
end
