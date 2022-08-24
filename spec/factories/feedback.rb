FactoryBot.define do
  factory :feedback do
    description { 'dhjghgdsfh' }
    counsellar { :user }
    customer { :user }
  end
end
