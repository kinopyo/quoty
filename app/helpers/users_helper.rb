module UsersHelper
  def user_avatar(user, options = {})
    options.reverse_merge!(no_link: false, size: '80x80')
    link_options = options.delete(:link_options)

    if user.image
      user_image = image_tag(user.image, options)
    else
      # 80x80 => 80
      gravatar_image_size = options.delete(:size)[0..1]
      user_image = image_tag gravatar_image_url(user.email_md5, gravatar_image_size), options
    end

    if options[:no_link]
      user_image
    else
      link_to user_image, user, link_options
    end
  end

  # details :https://en.gravatar.com/site/implement/images/
  def gravatar_image_url(email_md5, size, default_image_url = 'retro')
    "http://www.gravatar.com/avatar/#{email_md5}?s=#{size}&d=#{default_image_url}"
  end
end
