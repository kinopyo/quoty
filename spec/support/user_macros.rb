module UserMacros
  module Feature
    def login(user = FactoryGirl.create(:user))
      case page.driver
      when Capybara::Webkit::Driver
        page.driver.browser.set_cookie("stub_user_id=#{user.id}; path=/; domain=127.0.0.1")
      else
        Capybara.current_session.driver.browser.set_cookie("stub_user_id=#{user.id}")
      end
    end

    def set_user_agent(ua)
      page.driver.header 'User-Agent', ua
    end
  end

  module Controller
    def login(user = FactoryGirl.create(:user))
      session[:user_id] = user.id

      user
    end
  end
end
