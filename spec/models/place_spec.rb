require 'rails_helper'

RSpec.describe Place, :type => :model do
  it "is valid with valid attributes" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      lat: 1,
      long: 1,
      user_id: user.id
    })
    expect(place).to be_valid
  end

  it "is not valid without a description" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      lat: 'abc',
      long: 'abc',
      user_id: user.id
    })
    expect(place).to_not be_valid
  end

  it "is not valid without a lat" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      long: 'abc',
      user_id: user.id
    })
    expect(place).to_not be_valid
  end
  
  it "is not valid without well-formatted lat" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      lat: 'abc',
      long: 1,
      user_id: user.id
    })
    expect(place).to_not be_valid
  end

  it "is not valid without a long" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      lat: '1',
      user_id: user.id
    })
    expect(place).to_not be_valid
  end
  
  it "is not valid without well-formatted long" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      lat: 'abc',
      long: 1,
      user_id: user.id
    })
    expect(place).to_not be_valid
  end

  it "is not valid without user_id" do
    User.destroy_all
  
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })

    place = Place.create({
      description: 'abc',
      lat: 'abc',
      long: 'abc'
    })
    expect(place).to_not be_valid
  end
end