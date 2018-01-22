require 'watir'
require 'watir-scroll'
require 'active_support'
require 'active_support/core_ext'
require 'addressable/template'
require 'nokogiri'

require "insite/constants"
require "insite/insite"
require "insite/exceptions"
require "insite/version"

# Modules containing methods that are used in more than one place. The files in
# watir_methods.rb are used at the class level and the files in common_methods.rb
# are used in class instances.
require "insite/methods/watir_methods"
require "insite/methods/common_methods"

# Files for Insite::Page
require "insite/page/page_class_methods"
require "insite/page/page_instance_methods"
require "insite/page/undefined_page"

# Files for Insite::Widget.
require "insite/widget/widget"
require "insite/widget/widget_methods"

# Files for Insite::Feature.
require "insite/feature/feature"

# Files for ElementContainer.
require "insite/element_container/element_container"
