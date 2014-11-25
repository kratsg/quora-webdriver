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
        @Stats ||= Stats.new(@browser)
      end

      class Stats
        include QuoraWebDriver::StatsModule
      end # Stats
    end # Quora

  end # Browser
end # Watir
