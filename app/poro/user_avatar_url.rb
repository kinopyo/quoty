class UserAvatarUrl
  attr_reader :user, :image_size

  def initialize(user, image_size = '80')
    @user = user
    @image_size = image_size[0..1] # "80x80" => "80"
  end

  def url
    user.image || gravatar_image_url(image_size)
  end

  def gravatar_image_url(size, default_image = 'retro')
    "http://www.gravatar.com/avatar/#{user.email_md5}?s=#{size}&d=#{default_image}"
  end
end
