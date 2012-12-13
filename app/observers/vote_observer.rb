class VoteObserver < ActiveRecord::Observer
  def after_destroy(vote)
    PublicActivity::Activity.where(trackable_type: 'Vote', trackable_id: self.id).destroy_all
  end
end
