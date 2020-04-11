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
class Address < ApplicationRecord
  belongs_to :user

  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :prefecture_code, presence: true
  validates :post_code, presence: true, length: { is: 7 } 

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name)&.code
  end
end
