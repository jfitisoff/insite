# TODO: A lot of this should be handled via delegation.
module Insite
  module CommonMethods
    # Returns a Nokogiri document for the object ONLY. So no need to specify a
    # relative path.
    def document(xpath = nil)
      if xpath
        Nokogiri::HTML(html).xpath(xpath)
      else
        Nokogiri::HTML(html)
      end
    end
    alias nokogiri document

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
        sleep 0.2
        begin
          # k = k.to_sym
          # if self.is_a?(Component)
          #   elems = @component_elements
          # else
          #   elems = @page_elements
          # end
          #
          # # TODO: DRY
          # if self.is_a?(Insite::DefinedPage) && @page_elements.include?(k)
          elem = public_send(k)
          if elem.is_a?(Insite::Element)
            if [Insite::FileField, Insite::TextField, Insite::TextArea].include? elem.class
              elem.set v
            elsif [Insite::Select].include? elem.class
              elem.select v
            elsif [Insite::Anchor, Insite::Button].include? elem.class
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
            elsif elem.is_a?(Insite::Radio)
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
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}' \
                (You can only set a radio button, so false is not a valid argument.)"
              else
                raise ArgumentError, "Unsupported argument for #{elem.class}: '#{v}'"
              end
            elsif elem.is_a?(Insite::CheckBox)
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
          elsif elem.is_a?(Component) #&& @component_elements.include?(k)

            w = public_send(k)

            begin
              if w.is_a?(Component) && v.is_a?(Hash)
                w.update_object(**v)
              elsif w.is_a?(Component) && w.respond_to?(:update)
                w.update(v)
              end
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
                raise(
                  ArgumentError,
                  "Dynamic method call failed for #{k}: #{e2.try(:message)}",
                  e2.backtrace
                )
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
            raise e, "Failure trying to update #{k} with #{v.class}: #{v}. Original message: #{e.try(:message)}\n" + e.backtrace.join("\n")
          end
        end
        sleep 0.2
      end
      sleep 1
      hash_args
    end

    # Duplicates Watir DOM element argument parsing for element methods.
    private
    def parse_args(*args)
      args = args.flatten if args.is_a?(Array)
      case args.length
      when 2
        return { args[0] => args[1] }
      when 1
        obj = args.first
      when 0
        return {}
      end
    end
    public
  end
end
