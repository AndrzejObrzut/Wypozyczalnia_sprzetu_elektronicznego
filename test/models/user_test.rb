
class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "the count of users" do

    user = User.new(
                  user_name: "test",
                  password: "password",
                  first_name: "Test",
                  last_name: "test2",
                  email: "test.pawlus@gmail.com",
                  phone: "123123123",
                  birth_date: '1994-08-09',
                  is_admin: true,
                  regulations_accepted: true)

    user.save

    assert_equal(user.errors.messages, {})
    assert_equal(User.count, 1)
  end


  test "the password invisibility" do

    user = User.new(
                 user_name: "test",
                 first_name: "Test",
                 last_name: "test2",
                 password: "password",
                 email: "test.pawlus@gmail.com",
                 phone: "123123123",
                 birth_date: '1994-08-09',
                 is_admin: true,
                 regulations_accepted: true)
    user.save
    assert !User.find(user.id).password, "Password is saved!"
  end

end
