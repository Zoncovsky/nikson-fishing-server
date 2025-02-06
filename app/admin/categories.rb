ActiveAdmin.register Category do
  permit_params :name, :logo

  filter :name
  filter :created_at

  index do
    id_column
    column :name
    column :logo do |category|
      if category.logo.attached?
        image_tag url_for(category.logo.variant(:thumb))
      else
        I18n.t("admin.categories.not_uploaded")
      end
    end
    column :created_at

    actions
  end

  show do
    panel :category do
      attributes_table_for resource do
        row :name
        row :logo do |category|
          image_tag url_for(category.logo.variant(:thumb))
        end
        row :created_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :logo, as: :file
      if f.object.logo.attached?
        div do
          image_tag url_for(f.object.logo), style: "max-width: 200px;"
        end
      end
    end

    f.actions
  end
end
