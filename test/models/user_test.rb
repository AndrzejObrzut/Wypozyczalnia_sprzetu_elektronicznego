require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_create_user

    user = User.new(
    user_name: "test",
    first_name: "Test",
    second_name: "test2",
    password: "password",
    email: "sebastian.pawlus@gmail.com",
    phone: "123123123")

    user.save

    assert_equal(user.errors.messages, {})
    assert_equal(User.count, 1)

   end

   def test_password_invisibility

     user = User.new(
     user_name: "test",
     first_name: "Test",
     second_name: "test2",
     password: "password",
     email: "sebastian.pawlus@gmail.com",
     phone: "123123123")

     user.save

     assert !User.find(user.id).password

    end


end
