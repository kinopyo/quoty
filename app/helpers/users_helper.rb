module UsersHelper
  def user_avatar(user, options = {})
    image_url = 'guest_user.png'
    image_url = user.image if user.image

    link_to user do
      image_tag image_url, options
    end
  end
end
