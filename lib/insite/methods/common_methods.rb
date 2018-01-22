module Insite
  module CommonMethods
    def update_object(args={}) # test
      failed = []
      args.each do |k, v|
        begin
          k = k.to_sym
          if @page_elements.include?(k)
            elem = send(k)

            if [Watir::Alert, Watir::FileField, Watir::TextField, Watir::TextArea].include? elem.class
              elem.set v
            elsif [Watir::Select].include? html_element.class
              elem.select v
            elsif [Watir::Anchor, Watir::Button].include? html_element.class
              case v
              when Symbol
                elem.send v
              when TrueClass
                elem.click
              when FalseClass
                # Do nothing here.
              else
                raise ArgumentError, "Unsupported argument for #{html_element.class}: '#{v}'"
              end
            elsif html_element.is_a?(Watir::RadioCollection)
              # TODO: Remove, not a general use case
              rb = elem.to_a.find do |r|
                r.text =~ /#{Regexp.escape(v)}/i || r.parent.text =~ /#{Regexp.escape(v)}/i
              end

              if rb
                rb.click
              else
                raise "No matching radio button could be detected for '#{val}' for #{html_element}."
              end
            else
              case v
              when Symbol
                elem.send v
              when TrueClass
                elem.set
              when FalseClass
                elem.clear
              else
                raise ArgumentError, "Unsupported argument for #{html_element.class}: '#{v}'"
              end
            end
          elsif @widget_elements.include?(k)
            w = send(k)
            # [:center, :top, :bottom].each do
            # begin
            #   sleep 0.2
            #   unless send(k).present?
            #     send(k).scroll.to #(:top)
            #     sleep 0.2
            #   end
            # rescue => e
            #   send(k).wait_until_present(timeout: 15)
            # end

            begin
              w.update(v)
            rescue => e
              begin
                if v.is_a?(Array)
                  send(k).update(v)
                else
                  send(k).update(*v)
                end
              rescue => e2
                raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace
              end
            end
          else
            # Temporary band-aid to support widgets. TODO: The long-term solution is
            # to have the page track what widgets it has.
            begin
              if v.is_a?(Array)
                send(k, *v)
              else
                send(k, v)
              end
            rescue => e
              begin
                if v.is_a?(Array)
                  send(k).update(v)
                else
                  send(k).update(*v)
                end
              rescue => e2
                raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace
              end
            end
          end
        rescue Watir::Exception::ObjectDisabledException, Watir::Exception::UnknownObjectException, Selenium::WebDriver::Error::ElementNotVisibleError => e
          unless failed.include?(k)
            puts "Rescued #{e.class} when trying to update #{k}. Sleeping 5 seconds and then trying again."
            failed << k
            sleep 5
            redo
          end
        end
      end
      sleep 1
      args
    end

    # Returns a Nokogiri document for the object ONLY. So no need to specify a
    # relative path.
    def nokogiri
      Nokogiri::HTML(html)
    end
  end
end



# module Insite
#   module CommonMethods
#     def update_object(args={}) # test
#       failed = []
#       args.each do |k, v|
#         begin
#           k = k.to_sym
#           if @page_elements.include?(k)
#             begin
#               sleep 0.2
#               unless send(k).present?
#                 send(k).scroll.to(:top)
#                 sleep 0.2
#               end
#             rescue => e
#               send(k).wait_until_present(timeout: 15)
#             end
#             tmp = send(k)
#
#             if tmp.is_a? Watir::WhenPresentDecorator
#               html_element = tmp.instance_variable_get(:@element)
#             else
#               html_element = tmp
#             end
#
#             if [Watir::Alert, Watir::FileField, Watir::TextField, Watir::TextArea].include? html_element.class
#               html_element.set v
#             elsif [Watir::Select].include? html_element.class
#               html_element.select v
#             elsif [Watir::Anchor, Watir::Button].include? html_element.class
#               case v
#               when Symbol
#                 html_element.send v
#               when TrueClass
#                 html_element.click
#               when FalseClass
#                 # Do nothing here.
#               else
#                 raise ArgumentError, "Unsupported argument for #{html_element.class}: '#{v}'"
#               end
#             elsif html_element.is_a?(Watir::RadioCollection)
#               rb = html_element.to_a.find do |r|
#                 r.text =~ /#{Regexp.escape(v)}/i || r.parent.text =~ /#{Regexp.escape(v)}/i
#               end
#
#               if rb
#                 rb.click
#               else
#                 raise "No matching radio button could be detected for '#{val}' for #{html_element}."
#               end
#             else
#               case v
#               when Symbol
#                 html_element.send v
#               when TrueClass
#                 html_element.set
#               when FalseClass
#                 html_element.clear
#               else
#                 raise ArgumentError, "Unsupported argument for #{html_element.class}: '#{v}'"
#               end
#             end
#           elsif @widget_elements.include?(k)
#             # [:center, :top, :bottom].each do
#             begin
#               sleep 0.2
#               unless send(k).present?
#                 send(k).scroll.to #(:top)
#                 sleep 0.2
#               end
#             rescue => e
#               send(k).wait_until_present(timeout: 15)
#             end
#
#             begin
#               tmp = send(k).update(v)
#             rescue => e
#               begin
#                 if v.is_a?(Array)
#                   send(k).update(v)
#                 else
#                   send(k).update(*v)
#                 end
#               rescue => e2
#                 raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace
#               end
#             end
#           else
#             # Temporary band-aid to support widgets. TODO: The long-term solution is
#             # to have the page track what widgets it has.
#             begin
#               if v.is_a?(Array)
#                 send(k, *v)
#               else
#                 send(k, v)
#               end
#             rescue => e
#               begin
#                 if v.is_a?(Array)
#                   send(k).update(v)
#                 else
#                   send(k).update(*v)
#                 end
#               rescue => e2
#                 raise ArgumentError, "Dynamic method call failed for #{k}.", e2.backtrace
#               end
#             end
#           end
#         rescue Watir::Exception::ObjectDisabledException, Watir::Exception::UnknownObjectException, Selenium::WebDriver::Error::ElementNotVisibleError => e
#           unless failed.include?(k)
#             puts "Rescued #{e.class} when trying to update #{k}. Sleeping 5 seconds and then trying again."
#             failed << k
#             sleep 5
#             redo
#           end
#         end
#       end
#       sleep 1
#       args
#     end
#
#     # Returns a Nokogiri document for the object ONLY. So no need to specify a
#     # relative path.
#     def nokogiri
#       Nokogiri::HTML(html)
#     end
#   end
# end
