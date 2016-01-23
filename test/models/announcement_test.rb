require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def test_create_announcment

    
    @category = AnnouncementCategory.new(name: "Category_name",
                                        image: 100101010101010101,
                                        filename: "Category_name.png",
                                        mime_type: "image/png",
                                        size: 108)
    @category.save

    @user = User.new(
                  user_name: "test",
                  password: "password",
                  first_name: "Test",
                  last_name: "test2",
                  email: "test.pawlus@gmail.com",
                  phone: "123123123",
                  birth_date: '1994-08-09',
                  is_admin: true,
                  regulations_accepted: true)
    @user.save

    announcement = Announcement.new(
                              announcement_category_id: @category.id,
                              user_id: @user.id,
                              title: "Test",
                              description: "test2  est2 est2",
                              price_per_hour: 15,
                              price_per_day: 100)
    announcement.save

    assert_equal(announcement.errors.messages, {})
    assert_equal(Announcement.count, 1)
   end

end
