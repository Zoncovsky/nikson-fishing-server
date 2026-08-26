puts 'Seeding development data...'

OrderProduct.delete_all
Order.delete_all
Product.delete_all
Category.delete_all
User.delete_all
AdminUser.delete_all

admin_users = 10.times.map do |index|
  AdminUser.create!(
    email: "admin#{index + 1}@example.com",
    password: 'Password123',
    password_confirmation: 'Password123'
  )
end

puts "Created #{admin_users.count} admin users"

category_names = [
  'Спінінг',
  'Морська риба',
  'Приманки',
  'Оснащення',
  'Рибальські котушки',
  'Вудки',
  'Ліски',
  'Сумки',
  'Аксесуари',
  'Рибальський одяг'
]

categories = category_names.map.with_index do |name, index|
  Category.create!(name: name)
end

puts "Created #{categories.count} categories"

first_names = %w[
  Андрій
  Олександр
  Сергій
  Ігор
  Віталій
  Дмитро
  Микола
  Юрій
  Павло
  Олег
]

last_names = %w[
  Коваленко
  Шевченко
  Бондаренко
  Петров
  Іванов
  Сидоренко
  Козлов
  Лисенко
  Василенко
  Романенко
]

users = 10.times.map do |index|
  User.create!(
    first_name: first_names[index],
    last_name: last_names[index],
    email: "user#{index + 1}@example.com",
    phone_number: "+38050#{(index + 1).to_s.rjust(6, '0')}",
    password: 'Password123',
    password_confirmation: 'Password123',
    confirmed_at: Time.current
  )
end

puts "Created #{users.count} users"

product_prefixes = [
  'Класичний',
  'Професійний',
  'Експерт',
  'Легкий',
  'Туристичний',
  'Нічний',
  'Силовий',
  'Преміум',
  'Спортивний',
  'Річковий'
]

products = 20.times.map do |index|
  category = categories[index % categories.length]
  product_name = "#{category.name} #{product_prefixes[index % product_prefixes.length]} #{index + 1}"

  Product.create!(
    name: product_name,
    description: "Якісний товар для риболовлі з надійною конструкцією та перевіреною ергономікою. Артикул: #{index + 1}.",
    price: 250 + (index * 73) % 2400,
    category: category,
    is_popular: index.even?,
    is_new_arrival: index % 3 == 0
  )
end

puts "Created #{products.count} products"

cities = %w[Київ Львів Одеса Харків Дніпро Запоріжжя Вінниця Черкаси Рівне Житомир]
addresses = [
  'вул. Лесі Українки, 15',
  'просп. Перемоги, 42',
  'вул. Шевченка, 88',
  'пров. Козацький, 7',
  'вул. Миру, 121',
  'бульв. Тараса Шевченка, 30',
  'вул. Садова, 5',
  'пл. Незалежності, 12',
  'вул. Гагаріна, 64',
  'пр-т Свободи, 19'
]

orders = 10.times.map do |index|
  user = users[index]
  selected_products = products.sample(2)
  total = selected_products.sum { |product| product.price.to_i }

  Order.create!(
    user: user,
    customer_email: user.email,
    address: addresses[index],
    city: cities[index],
    post_number: format('%05d', 10000 + index * 17),
    comment: "Замовлення для #{user.full_name}. Доставка вчасно.",
    status: index.even? ? :done : :pending,
    total: total
  )
end

puts "Created #{orders.count} orders"

order_products = orders.each_with_index.flat_map do |order, index|
  selected_products = products.values_at((index * 2) % products.length, ((index * 2) + 1) % products.length)

  selected_products.map do |product|
    OrderProduct.create!(
      order: order,
      product: product,
      quantity: 1 + (index % 3)
    )
  end
end

puts "Created #{order_products.count} order products"

puts 'Seeding complete.'
