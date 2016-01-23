
class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "the count of users" do

    # user = User.new(
    #               user_name: "test",
    #               password: "password",
    #               first_name: "Test",
    #               last_name: "test2",
    #               email: "test.pawlus@gmail.com",
    #               phone: "123123123",
    #               birth_date: '1994-08-09',
    #               is_admin: true,
    #               regulations_accepted: true)
    #
    # user.save

    user = FactoryGirl.create(:user)
    assert_equal(user.errors.messages, {})
    assert_equal(User.count, 1)
  end


  test "the password invisibility" do

    # user = User.new(
    #              user_name: "test",
    #              first_name: "Test",
    #              last_name: "test2",
    #              password: "password",
    #              email: "test.pawlus@gmail.com",
    #              phone: "123123123",
    #              birth_date: '1994-08-09',
    #              is_admin: true,
    #              regulations_accepted: true)
    # user.save
    user = FactoryGirl.create(:user)
    assert !User.find(user.id).password, "Password is saved!"
  end

  test "check_the_permissions" do
    admin = FactoryGirl.create(:is_admin)
    assert_equal(admin.is_admin, true)
  end

end
