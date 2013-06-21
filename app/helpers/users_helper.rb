module UsersHelper
  def user_avatar(user, options = {})
    options = options.reverse_merge(as_link: true, size: '80x80')
    link_options = options.delete(:link_options)

    url = UserAvatarUrl.new(user, options[:size]).url

    user_image = image_tag url, options
    if options[:as_link]
      link_to user_image, user, link_options
    else
      user_image
    end
  end
end
