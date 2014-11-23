module Watir
  class Browser

    attr_reader :quora
    def quora
      @Quora ||= Quora.new(self)
    end

    class Quora
      include QuoraWebDriver::QuoraModule

      attr_reader :stats
      def stats
        @Stats ||= Stats.new(self)
      end
    end # Quora

  end # Browser
end # Watir
