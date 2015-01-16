# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# create Users
avatar_list = [
     "our-team01.jpg",
     "our-team02.jpg",
     "our-team03.jpg",
     "our-team04.jpg",
     "our-team05.jpg",
     "our-team06.jpg",
     "our-team07.jpg",
     "our-team08.jpg",
     "our-team09.jpg",
     "our-team10.jpg",
     "our-team11.jpg",
     "our-team12.jpg"
]

User.create(
    email: 'george2code@gmail.com',
    password: '12345678',
    first_name: 'Yuri',
    last_name: 'Systems',
    avatar: avatar_list[0].to_s,
    verified: false,
    birth_date: Faker::Date.between(40.years.ago, 19.years.ago),
    about: 'Inflammatio denego necessitatibus caelestis autus illum.'
)

27.times do
    User.create(
        email: Faker::Internet.email,
        password: Faker::Internet.password(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        avatar: avatar_list[rand(0..11)].to_s,
        verified: false,
        birth_date: Faker::Date.between(40.years.ago, 19.years.ago),
        about: Faker::Lorem.sentence(3, true)
    )
end



# root categories
RootCategory.create(name: 'Games of Chance', slug: 'gambling', iconName: 'cat-99')
RootCategory.create(name: 'Money', slug: 'money', iconName: 'cat-24')
RootCategory.create(name: 'Kids', slug: 'kids', iconName: 'cat-27')
RootCategory.create(name: 'Home and Garden', slug: 'home_garden', iconName: 'cat-41')
RootCategory.create(name: 'Computer and Accessories', slug: 'computer', iconName: 'cat-40')
RootCategory.create(name: 'Health and Wellbeing', slug: 'health_wellbeing', iconName: 'cat-147')
RootCategory.create(name: 'Leisure', slug: 'leisure', iconName: 'cat-46')
RootCategory.create(name: 'Food and Beverage', slug: 'food_beverage', iconName: 'cat-8')
RootCategory.create(name: 'Art', slug: 'art', iconName: 'cat-189')



# sub-categories
Subcategory.create(root_category_id: 1, name: 'Totalizator', slug: 'betting')
Subcategory.create(root_category_id: 2, name: 'Insurance', slug: 'insurance')
Subcategory.create(root_category_id: 5, name: 'Software', slug: 'software')



# companies
10.times do
  Company.create(
      name: Faker::Lorem.sentence(2),
      description: Faker::Lorem.sentence(18, false, 10),
      home_site: Faker::Internet.url,
      slug: Faker::Lorem.word,
      zip: Faker::Number.number(6),
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      logo: Faker::Company.logo)
end


# company categories
CompanyCategory.create(subcategory_id: 1, company_id: 1)
CompanyCategory.create(subcategory_id: 1, company_id: 2)
CompanyCategory.create(subcategory_id: 1, company_id: 3)
CompanyCategory.create(subcategory_id: 1, company_id: 4)
CompanyCategory.create(subcategory_id: 1, company_id: 5)
CompanyCategory.create(subcategory_id: 2, company_id: 6)
CompanyCategory.create(subcategory_id: 2, company_id: 7)
CompanyCategory.create(subcategory_id: 3, company_id: 8)
CompanyCategory.create(subcategory_id: 3, company_id: 9)
CompanyCategory.create(subcategory_id: 3, company_id: 10)



# reviews
Company.all.each do |companyItem|
    rand(6..12).times do
        Review.create(
            user_id: rand(1..28).to_i,
            company_id: companyItem.id,
            rating: rand(1..5).to_i,
            order_id: Faker::Number.number(10),
            review_short: Faker::Lorem.sentence(3),
            review_full: Faker::Lorem.sentence(6, true),
            is_confirmed: true
        )
    end
end