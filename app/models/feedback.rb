class Feedback < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :counsellar, class_name: 'User', foreign_key: 'counsellar_id'
end
