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
require 'rails_helper'

RSpec.describe Address, type: :model do
  it "address_cityがあること" do
    
  end
end
