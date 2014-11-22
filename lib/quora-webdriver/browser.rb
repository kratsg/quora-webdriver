module Watir
  class Browser
    def quora
      @Quora ||= Quora.new(self)
    end
  end # Browser
end # Watir
