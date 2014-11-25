module QuoraWebDriver
  module StatsModule
    attr_reader :notifs, :openqs

    def initialize(browser)
      @browser = browser
    end

    def notifs
      el = @browser.div(:class=>/NotifsNavItem/).span(:class=>/badge/)
      if el.exist? then
        @notifs = el.text.to_i
      else
        @notifs = 0
      end
    end

    def openqs
      el = @browser.div(:class=>/OpenQsNavItem/).span(:class=>/badge/)
      if el.exist? then
        @openqs = el.text.to_i
      else
        @openqs = 0
      end
    end
  end
end
