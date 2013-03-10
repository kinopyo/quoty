require 'spec_helper'

describe ResetPasswordMailer do
  describe 'send_mail' do
    let(:user) { stub(:user, email: 'foo@bar.com', reset_password_token: 'foobar') }
    let(:mail) { ResetPasswordMailer.send_mail(user) }

    it "renders the headers" do
      mail.to.should == user.email
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_reset_password_path(user.reset_password_token))
    end
  end
end
