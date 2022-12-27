ActiveAdmin.register User do
  actions :index, :show, :edit, :update
  permit_params :email, :login
  filter :created_at
  index do
    selectable_column
    id_column
    column :email
    column :login
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :login
      row :email
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :login
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :login, :email, :password_digest
  #
  # or
  #
  # permit_params do
  #   permitted = [:login, :email, :password_digest]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
