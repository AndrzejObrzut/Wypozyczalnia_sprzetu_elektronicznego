require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

   def test_book

     tester = User.new :user_name => users(:one).user_name,
                          :password => users(:one).password,
                          :password_confirmation => users(:one).password_confirmation,
                          :first_name => users(:one).first_name,
                          :second_name => users(:one).second_name,
                          :email => users(:one).email,
                          :phone => users(:one).phone,
                          :created_at => users(:one).created_at

     assert tester.save

     tester_copy = User.find(tester.id)

     assert_equal tester.user_name, tester_copy.user_name

     perl_book.user_name = "Tester"

     assert tester.save
     assert tester.destroy
   end

end
