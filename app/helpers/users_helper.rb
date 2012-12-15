module UsersHelper
  def user_avatar(user, options = {})
    options.reverse_merge!(no_link: false)

    image_url = 'guest_user.png'
    image_url = user.image if user.image

    user_image = image_tag(image_url, options)

    if options[:no_link]
      user_image
    else
      link_to user_image, user, options[:link_options]
    end
  end
end
