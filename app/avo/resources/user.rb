class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :email, as: :text
    field :confirmation_token, as: :text
    field :confirmed_at, as: :date_time
    field :confirmation_sent_at, as: :date_time
    field :unconfirmed_email, as: :text
    field :first_name, as: :text
    field :last_name, as: :text
    field :phone_number, as: :text
    field :provider, as: :text
    field :uid, as: :text
    field :orders, as: :has_many
  end
end
