require 'spec_helper'

describe AccountConsolidator do
  describe 'Consolidates user account' do
    it 'deletes another user account' do
      user = create(:user_with_provider)
      another = create(:user_with_provider)

      AccountConsolidator.new(user, another).consolidate

      expect(another).to be_destroyed
    end

    it "consolidates another user's provider to target user" do
      user = create(:user_with_provider)
      another = create(:user_with_provider)

      AccountConsolidator.new(user, another).consolidate

      expect(user.providers.size).to eq(2)
    end
  end

  describe 'Updates email' do
    it 'updates email if target does not have one, and another user has one' do
      user = create(:user_with_provider, email: nil)
      another = create(:user_with_provider, email: 'foo@bar.com')

      AccountConsolidator.new(user, another).consolidate

      expect(user.email).to eq('foo@bar.com')
    end

    it 'does not update email if target has one' do
      user = create(:user_with_provider, email: 'super@cool.com')
      another = create(:user_with_provider, email: 'foo@bar.com')

      AccountConsolidator.new(user, another).consolidate

      expect(user.email).not_to eq('foo@bar.com')
    end
  end

  describe 'Updates associations' do
    it 'updates quotes, votes, comments, activites' do
      user = create(:user_with_provider)
      another = create(:user_with_provider)

      quote = create(:quote, user: another)
      comment = create(:comment, user: another, quote: quote)
      vote = create(:vote, user: another, quote: quote)
      new_activities = another.activities.reject { |activity| activity.key == 'user.create' }

      AccountConsolidator.new(user, another).consolidate

      expect(user.quotes).to include(quote)
      expect(user.comments).to include(comment)
      expect(user.votes).to include(vote)

      new_activities.each do |activity|
        expect(activity.owner).to eq(user)
      end
    end
  end
end
