ActiveAdmin.register Order do
  actions :index, :show, :destroy

  filter :customer_email
  filter :address
  filter :city
  filter :created_at

  index do
    selectable_column

    id_column
    column :user
    column :customer_email
    column :address
    column :city
    column :post_number
    column :total
    column :comment
    column :created_at
    column :status

    actions
  end

  show do
    attributes_table do
      row :user
      row :customer_email
      row :address
      row :city
      row :post_number
      row :comment
      row :total
      row :status
    end
    panel t('admin.order.products') do
      table_for resource.products do
        column :id do |product|
          link_to product.id, admin_product_path(product)
        end
        column :name
        column :description
        column :price
        column :is_popular
        column :category
      end
    end
  end
end
