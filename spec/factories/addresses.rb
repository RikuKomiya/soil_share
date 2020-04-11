# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address_building :string(255)      not null
#  address_city     :string(255)      not null
#  address_street   :string(255)      not null
#  post_code        :integer          not null
#  prefecture_code  :integer          not null
#  user_id          :bigint           not null
#
FactoryBot.define do
  factory :address do
    post_code { 2400112 }
    prefecture_code { 1 }
    address_city {"市川市"}
    address_street { "南大野" }
    address_building { "グリーンビル" }
    association :user
  end
end
