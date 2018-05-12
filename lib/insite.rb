require 'watir'
require 'watir-scroll'
require 'active_support'
require 'active_support/core_ext'
require 'addressable/template'
require 'nokogiri'

require "insite/constants"
require "insite/insite"
require "insite/errors"
require "insite/version"

# Modules with method definitions used by UI metaclasses.
require "insite/methods/dom_methods"
require "insite/methods/common_methods"

# Files for Insite element wrapper classes.
require "insite/element/element"
require "insite/element/element_definitions/elements"
require "insite/element/element_definitions/element_methods"

# Files for Insite::Widget.
require "insite/widget/widget"
require "insite/widget/widget_methods"

# Files for Insite::Feature.
require "insite/feature/feature"

# Files for pages (defined/undefined.)
require "insite/page/defined_page"
require "insite/page/undefined_page"
