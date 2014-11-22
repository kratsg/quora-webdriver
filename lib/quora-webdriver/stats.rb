module QuoraWebDriver
  class Stats
    attr_reader :notifs, :openqs

    def initialize(browser)
      @browser = browser
    end

    def notifs
      el = @browser.div(:class=>/NotifsNavItem/).span(:class=>/badge/)
      @notifs ||= (el.text.to_i && el.exist?) || 0
    end

    def openqs
      el = @browser.div(:class=>/OpenQsNavItem/).span(:class=>/badge/)
      @openqs ||= (el.text.to_i && el.exist?) || 0
    end
  end
end
