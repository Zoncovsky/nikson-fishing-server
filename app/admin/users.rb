ActiveAdmin.register User do
  actions :index, :show, :destroy

  filter :email
  filter :full_name
  filter :phone_number

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :created_at
    end
  end

  form do |f|
    f.inputs I18n.t("admin.users.user_details") do
      f.input :full_name
      f.input :phone_number
      f.input :email
    end
    f.actions
  end
end
