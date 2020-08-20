require 'rails_helper'

RSpec.describe User, :type => :model do
  User.destroy_all

  it "is valid with valid parameters" do
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })
    expect(user).to be_valid
  end
  
  it "is not valid without a name" do
    user = User.create({
      username: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })
    expect(user).to_not be_valid
  end
  
  it "is not valid without a username" do
    user = User.create({
      name: 'test',
      email: 'test@mail.com',
      password: 'test123'
    })
    expect(user).to_not be_valid
  end

  it "is not valid without well-formatted username" do
    user = User.create({
      name: 'test',
      username: 'test 1',
      email: 'test@mail.com',
      password: 'test123'
    })
    expect(user).to_not be_valid
  end

  it "is not valid without a email" do
    user = User.create({
      name: 'test',
      username: 'test',
      password: 'test123'
    })
    expect(user).to_not be_valid  
  end

  it "is not valid without well-formatted email" do
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test',
      password: 'test123'
    })
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.create({
      name: 'test',
      username: 'test',
      email: 'test@mail.com'
    })
    expect(user).to_not be_valid
  end
end