module Watir
  class Browser
    def get_common_method_names(mth)
      out = []
      (methods - Object.methods).each do |m|
        next if m.to_s == mth.to_s
        out << m if method(m.to_sym) == method(mth.to_sym)
      end
      out << mth
    end

    def get_class_for_method(mth)
      send(mth).class
    end

    def element_map
      out = {}
      Watir::Container.instance_methods.each do |mth|
        begin
          klass = get_class_for_method(mth).to_s.demodulize
          unless klass == String
            out[klass] = [] unless out[klass]
            out[klass] << get_common_method_names(mth)
            out[klass] = out[klass].flatten.uniq
          end
        rescue => e
          puts mth
        end
      end
      out
    end

    def build_element_classes
      str = ''
      Insite::METHOD_MAP.each do |k, v|
        tmp = <<~EOS
        class Insite::#{k.to_s.demodulize} < Insite::Element
        end

        EOS

        str << tmp
      end

      f = File.new("./lib/insite/element/element_definitions/elements.rb", 'w+')
      f.puts str
      f.close
    end

    def build_element_methods
      str = ''
      Insite::METHOD_MAP.each do |k, v|
        v.each do |mth|
tmp = <<-EOS
    def #{mth}(*args)
      #{"Insite::#{k.to_s.demodulize}".constantize}.new(
        @site,
        @browser.send(*args.unshift(__method__))
      )
    end

EOS
          str << tmp
        end
      end

      f = File.new("./lib/insite/element/element_definitions/element_methods.rb", 'w+')
out = <<-EOF
module Insite
  class Element
#{str}
  end
end
EOF
      f.puts out
      f.close
    end
  end
end
