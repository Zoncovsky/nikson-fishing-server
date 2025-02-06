ActiveAdmin.register Product do
  permit_params :name, :description, :price, :is_popular, :is_new_arrival, :category_id, images: []

  filter :created_at

  index do
    id_column
    column :name
    column :description
    column :category
    column :price
    column :is_popular
    column :is_new_arrival
    column :images do |product|
      if product.images.any?
        image_tag url_for(product.images.first.variant(:thumb))
      end
    end
    column :created_at

    actions
  end

  show do
    panel :product do
      attributes_table_for resource do
        row :name
        row :description
        row :category
        row :price
        row :is_popular
        row :is_new_arrival
        row :images do |product|
          if product.images.any?
            image_tag url_for(product.images.first.variant(:thumb))
          end
        end
        row :created_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category
      f.input :price
      f.input :is_popular
      f.input :is_new_arrival
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end
end
