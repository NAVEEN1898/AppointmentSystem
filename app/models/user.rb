class User < ApplicationRecord
	enum user_type: {  counsellar: 0, customer: 1 }
	has_many :services
	has_many :feedbacks
	has_many :appointments
end
