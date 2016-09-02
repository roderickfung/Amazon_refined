namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    @count = 1

    5.times do |x|
      fn = Faker::Name.first_name
      ln = Faker::Name.last_name
      @user = User.create!(
      first_name: fn,
      last_name: ln,
      email: fn+ln+'@'+Faker::Internet.domain_name,
      password: Faker::Internet.password
      )
    end

    @user = User.create!(
    first_name: 'Roderick',
    last_name: 'Fung',
    email: 'roderickfung@gmail.com',
    password: 'r2d34k5'
    )

    5.times do |x|
      @category = Category.create!(
      name: Faker::Commerce.department(2)
      )
    end

    1000.times do |x|
      @product = Product.create!(
      title: "#{Faker::Commerce.product_name}#{@count.to_s}",
      description: Faker::Lorem.paragraph(2),
      price: Faker::Commerce.price,
      category_id: rand(1..5),
      user_id: rand(1..6)
      )
      @count += 1
    end

    5000.times do |x|
      @review = Review.create!(
      star_count: rand(1..5),
      body: Faker::Lorem.paragraph(3),
      product_id: rand(1..1000),
      user_id: rand(1..6)
      )
    end

    10000.times do |x|
      name: Faker::Name.name

  end
end
