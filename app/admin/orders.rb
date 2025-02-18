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
    column :status do |order_status|
      status_tag order_status.status
    end

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
      row :status do |order_status|
        status_tag order_status.status
      end
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

  member_action :done, method: :patch

  action_item :done, only: :show do
    if resource.pending?
      link_to t('admin.order.action_done'), done_admin_order_path(resource), method: :patch
    end
  end

  controller do
    def done
      resource.update(status: :done)

      redirect_to admin_order_path(resource), notice: t('admin.order.notice_done')
    end
  end
end
