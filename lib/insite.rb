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
require "insite/element/generated/element_instance_methods"
require "insite/element/element"
require "insite/element/element_collection"
require "insite/element/generated/element_classes"
require "insite/element/generated/class_map"

# Files for Insite::Component.
require "insite/component/component_instance_methods"
require "insite/component/component"
require "insite/component/component_collection"
require "insite/component/component_methods"

# Files for Insite::Feature.
require "insite/feature/feature"

# Files for pages (defined/undefined.)
require "insite/page/defined_page"
require "insite/page/undefined_page"
