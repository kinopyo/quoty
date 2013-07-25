class AccountConsolidator
  attr_reader :user, :another

  def initialize(user, another)
    @user = user
    @another = another
  end

  def consolidate
    user.providers << another.providers

    update_email

    update_associations(:quotes,)
    update_associations(:comments)
    update_associations(:votes)

    update_activites

    # use delete to avoid destorying cached associations of another user, even
    # though those data are already set to target user.
    another.delete
  end

  private

  def update_email
    User.class_eval do
      def should_generate_new_friendly_id?
        false
      end
    end
    user.email ||= another.email
    user.save
  end

  def update_associations(associations)
    another.send(associations).each do |association|
      association.update!(user: user)
    end
  end

  def update_activites
    another.activities.each do |activity|
      next if activity.key == 'user.create'
      activity.owner_id = user.id
      activity.save
    end
  end
end
