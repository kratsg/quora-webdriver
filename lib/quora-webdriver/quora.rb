module Watir
  class Browser
    class Quora

      attr_reader :base_url, :url
      attr_accessor :user


      def initialize(browser)
        @browser = browser
        @base_url = "https://www.quora.com/"
        @logged_in = false
      end

      def user
        @user ||= :Giordon_Stark
      end

      def stringify
        @user.to_s.gsub("_","-")
      end

      def get_login_email_text
        @browser.text_field({:name=>"email", :class=>/header_login_text_box/})
      end

      def get_login_password_text
        @browser.text_field({:name=>"password", :class=>/header_login_text_box/})
      end

      def get_login_submit_button
        @browser.button({:value=>"Login"})
      end

      def get_add_question_div
        @browser.div({:class=>/inner/, :text=>/Add Question/})
      end

      def login(choice='0')
        return @logged_in if @logged_in
        until ['1', '2'].include?(choice)
          puts "This page requires a login.\n\t(1) Login via browser\n\t(2) Login via command line"
          choice = gets.chomp
        end
        case choice
        when '1'
          puts "Please navigate to the browser and login."
        when '2'
          email = ask("Enter email: "){ |x| x.echo = true }
          password = ask("Enter password: "){ |x| x.echo = "*" }
          email_box = get_login_email_text
          password_box = get_login_password_text
          unless email_box.exist? and password_box.exist? then
            puts "There was an error getting the login boxes. Please login manually. Report this error to someone important."
            self.login('1')
          end
          email_box.set email
          password_box.set password
          get_login_submit_button.click
        end

        self.verify_login
      end

      def verify_login
        # check every 6 seconds for 1 minute
        login_count_checks = 0
        until @logged_in || (login_count_checks >= 60) do
          puts "\t Checking if logged in"
          @logged_in = get_add_question_div.exists?
          login_count_checks+=1
          sleep 1
        end

        if @logged_in then
          puts "Successfully logged in!"
        elsif @browser.text_field(:name=> "email", :class=>/header_login_text_box/).exist? then
          puts "There was an error logging in. Most likely a wrong username or password."
        else
          puts "There was an error logging in."
        end
        self.login
      end

      def goto(login = nil)
       @browser.goto "#{@url}#{login.nil? ? '?share=1' : ''}"
        unless login.nil? then
          self.login
        end
      end

      def home
        @url = "#{@base_url}"
        self.goto :login
      end

      def answers
        @url = "#{@base_url}#{self.stringify}/answers?share=1"
        self.goto
      end

      def content(subcategory = :all)
        case subcategory
        when :questions_added,
             :questions_followed,
             :answers,
             :posts
          @url = "#{@base_url}content?content_types=#{subcategory}"
        else
          @url = "#{@base_url}content"
        end
        self.goto :login
      end

      def scroll_n_times(n = 1)
        n.times do
          @browser.scroll.to :bottom
        end
      end

      def get_all
        last_size = 0
        while last_size != self.html.size do
          last_size = self.html.size
          @browser.scroll.to :bottom
          # sleep for 3 seconds to handle ajax request delay until page updates
          sleep 3
        end
      end
    end
  end
end
