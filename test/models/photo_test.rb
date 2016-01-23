require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def test_create_photo
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

    @announcement = Announcement.new(
                              announcement_category_id: @category.id,
                              user_id: @user.id,
                              title: "Test",
                              description: "test2  est2 est2",
                              price_per_hour: 15,
                              price_per_day: 100)
    @announcement.save
    photo = Photo.new(
                    announcement_id:         @announcement.id,
                    image:                   nil
                    )
    assert_not(photo.save)

   end
end
