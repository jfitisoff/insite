# TODO: A lot of this should be handled via delegation.
module Insite
  module CommonMethods
    # Returns a Watir::Browser object.
    def browser
      @browser
    end

    # Returns a Selenium::WebDriver::Driver object.
    def driver
      @browser.driver
    end

    # Don't override the default if it's already there.
    unless defined? :html
      # Returns current HTML for the object.
      def html
        @browser.html
      end
    end

    # Returns a string representation of the page.
    def inspect
      "#<#{self.class.name}:#{object_id} @url=#{@browser.url}>"
    end

    private
    def process_browser
      if @site.browser.is_a?(Watir::Browser)
        begin
          if @site.browser.exists?
            return @site.browser
          else
            raise(
              Insite::Errors::BrowserClosedError,
              "Browser check failed. The browser is no longer present.\n\n"
            )
          end
        rescue(Insite::Errors::BrowserNotOpenError) => e
          raise e
        rescue => e
          raise(
            Insite::Errors::BrowserResponseError,
            <<~eos
            Browser check failed. The browser returned an #{e.class} (#{e}) when it was queried.
            Backtrace for the error:
            #{e.backtrace.join("\n")}

            eos
          )
        end
      elsif @site.browser.nil?
        raise(
          Insite::Errors::BrowserNotOpenError,
          "A browser has not been defined for the site. Try using Site#open to " \
          "start a browser.\n\n"
        )
      else
        raise(
          Insite::Errors::BrowserNotValidError,
          "Expected: Watir::Browser. Actual: #{@site.browser.class}.\n\n"
        )
      end

    end
    public

    def update_object(hash_args = {})
      rescues = [
        Watir::Exception::ObjectDisabledException,
        Watir::Exception::UnknownObjectException,
        Selenium::WebDriver::Error::ElementNotVisibleError,
        Selenium::WebDriver::Error::UnknownError
      ]
      failed = []
      hash_args.each do |k, v|
        begin
          k = k.to_sym
          if @page_elements.include?(k)
            elem = public_send(k)

            if [Watir::Alert, Watir::FileField, Watir::TextField, Watir::TextArea].include? elem.class
              elem.set v
            elsif [Watir::Select].include? elem.class
              elem.select v
            elsif [Watir::Anchor, Watir::Button].include? elem.class
              case v
              when Symbol
                elem.public_send v
              when TrueClass
                elem.click
              when FalseClass
                # Do nothing here.
              else
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}'"
              end
            elsif elem.is_a?(Watir::Radio)
              case v
              when Symbol
                elem.public_send v
              when TrueClass
                3.times do
                  elem.set
                  break if elem.set?
                  sleep 0.5
                end
              when FalseClass
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}' (You can only set a radio button, so false is not supported.)"
              else
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}'"
              end
            elsif elem.is_a?(Watir::CheckBox)
              case v
              when Symbol
                elem.public_send v
              when TrueClass
                3.times do
                  elem.set
                  break if elem.set?
                  sleep 0.5
                end
              when FalseClass
                3.times do
                  elem.clear
                  break if !elem.set?
                  sleep 0.5
                end
                elem.clear
              else
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}'"
              end
            elsif elem.is_a?(Watir::RadioCollection)
              # TODO: Remove, not a general use case
              rb = elem.to_a.find do |r|
                r.text =~ /#{Regexp.escape(v)}/i || r.parent.text =~ /#{Regexp.escape(v)}/i
              end

              if rb
                rb.click
              else
                raise "No matching radio button could be detected for '#{val}' for #{elem}."
              end
            else
              case v
              when Symbol
                elem.public_send v
              when TrueClass
                elem.set
              when FalseClass
                elem.clear
              else
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}'"
              end
            end
          elsif @widget_elements.include?(k)
            w = public_send(k)

            begin
              w.update(v)
            rescue => e
              begin
                if v.is_a?(Array)
                  public_send(k).update(v)
                else
                  public_send(k).update(*v)
                end
              rescue => e2
                raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace.join("\n")
              end
            end
          else
            begin
              if v.is_a?(Array)
                public_send(k, *v)
              else
                public_send(k, v)
              end
            rescue => e
              begin
                if v.is_a?(Array)
                  public_send(k).update(v)
                else
                  public_send(k).update(*v)
                end
              rescue => e2
                raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace
              end
            end
          end
        rescue => e
          if rescues.any? { |err| e.is_a?(err) }
            unless failed.include?(k)
              puts "Rescued #{e.class} when trying to update #{k}. Sleeping 5 seconds and then trying again."
              failed << k
              sleep 5
              redo
            end
          else
            raise e, "Failure trying to update #{k} with #{v.class}: #{v}:\n" + e.backtrace.join("\n")
          end
        end
        sleep 0.2
      end
      sleep 1
      hash_args
    end

    # Returns a Nokogiri document for the object ONLY. So no need to specify a
    # relative path.
    def nokogiri
      Nokogiri::HTML(html)
    end
    alias document nokogiri
  end
end
