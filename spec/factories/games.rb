FactoryBot.define do
  factory :game do
    mode { [:pvp, :pve, :both].sample }
    release_date { "2023-07-15 11:37:22" }
    developer { Faker::Company.name }
    system_requirement
  end
end
