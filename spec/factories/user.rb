FactoryBot.define do
  factory :user do
    email { 'nn@.sgmail.com' }
    password { '123456' }
    user_type { 'counsellar' }
    name { 'naveen' }
  end
end
