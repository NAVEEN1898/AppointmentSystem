FactoryBot.define do
  factory :service do
    service_name { 'Service for patients' }
    time { Time.now }
  end
end
