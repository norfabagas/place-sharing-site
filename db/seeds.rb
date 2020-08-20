require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seeds_place(user)
  5.times do |index|
    Place.create({
      user: user,
      lat: Faker::Address.latitude,
      long: Faker::Address.longitude,
      description: Faker::Address.full_address
    })
  end
end

def seeds_user
  admin = User.create({
    name: 'admin',
    username: 'admin',
    email: 'admin@mail.com',
    password: 'admin123',
    password_confirmation: 'admin123'
  })

  seeds_place admin

  user = User.create({
    name: 'user',
    username: 'user',
    email: 'user@mail.com',
    password: 'user123',
    password_confirmation: 'user123'
  })

  Follow.create({
    follower_id: admin.id,
    following_id: user.id
  })
  
  Follow.create({
    follower_id: user.id,
    following_id: admin.id
  })

  seeds_place user
end

seeds_user