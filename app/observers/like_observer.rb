class LikeObserver < ActiveRecord::Observer
  def after_destroy(like)
    PublicActivity::Activity.where(trackable_type: 'Like', trackable_id: like.id).destroy_all
  end
end
