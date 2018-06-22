# https://github.com/watir/watir/pull/737
# TODO: Already merged to master, can remove after next release.
module Watir
  module Locators
    class Element
      class SelectorBuilder
        class XPath
          # @todo Get rid of building
          def lhs_for(_building, key)
            case key
            when :text, 'text'
              'normalize-space()'
            when String
              "@#{key}"
            when :href
              # TODO: change this behaviour?
              'normalize-space(@href)'
            when :type
              # type attributes can be upper case - downcase them
              # https://github.com/watir/watir/issues/72
              XpathSupport.downcase('@type')
            else
              "@#{key.to_s.tr("_", "-")}"
            end
          end
        end
      end
    end
  end
end

# https://github.com/watir/watir/blob/0943e7e6a88f58ad6bea0e33a9853e6f5676f31c/lib/watir/element_collection.rb
# TODO: Already merged to master, can remove after next release.
module Watir
  class ElementCollection
    def to_a
      hash = {}
      @to_a ||=
          elements.map.with_index do |e, idx|
            element = element_class.new(@query_scope, @selector.merge(element: e, index: idx))
            if [Watir::HTMLElement, Watir::Input].include? element.class
              tag_name = element.tag_name.to_sym
              hash[tag_name] ||= 0
              hash[tag_name] += 1
              Watir.element_class_for(tag_name).new(@query_scope, @selector.merge(element: e,
                                                                                   tag_name: tag_name,
                                                                                   index: hash[tag_name] - 1))
            else
              element
            end
          end
    end
  end
end
