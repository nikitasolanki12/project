# frozen_string_literal: true

ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :description
  #
  # or
  #
  # permit_params do
  # permitted = [:user_id, :description]
  # permitted << :other if params[:action] == 'create' && current_user.admin?
  # permitted
  # end

  permit_params :description, :user_id, :image

  index do
    selectable_column
    id_column
    column :user
    column :description
    column :image
    column :created_at
    actions
  end

  filter :description
  filter :image
  filter :user
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.pluck(:first_name, :id)
      f.input :description
      f.input :image
    end
    f.actions
  end
end
