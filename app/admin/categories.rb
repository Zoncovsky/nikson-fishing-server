ActiveAdmin.register Category do
  permit_params :name, :logo

  filter :name
  filter :created_at

  index do
    id_column
    column :name
    column :created_at

    actions
  end

  show do
    panel :category do
      attributes_table_for resource do
        row :name
        row :created_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
    end

    f.actions
  end
end
