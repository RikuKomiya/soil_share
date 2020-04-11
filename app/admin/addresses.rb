ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :post_code, :prefecture_code, :address_city, :address_street, :address_building, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:post_code, :prefecture_code, :address_city, :address_street, :address_building, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
