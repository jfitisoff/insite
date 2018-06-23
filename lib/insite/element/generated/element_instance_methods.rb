module Insite
  module ElementInstanceMethods
    def a(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Anchor.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def abbr(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "abbr"))
    end

    def abbrs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "abbr"))
    end

    def address(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "address"))
    end

    def addresses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "address"))
    end

    def area(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Area.new(self, parse_args(args).merge(tag_name: "area"))
    end

    def areas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::AreaCollection.new(self, parse_args(args).merge(tag_name: "area"))
    end

    def article(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "article"))
    end

    def articles(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "article"))
    end

    def as(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::AnchorCollection.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def aside(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "aside"))
    end

    def asides(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "aside"))
    end

    def audio(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Audio.new(self, parse_args(args).merge(tag_name: "audio"))
    end

    def audios(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::AudioCollection.new(self, parse_args(args).merge(tag_name: "audio"))
    end

    def b(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "b"))
    end

    def base(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Base.new(self, parse_args(args).merge(tag_name: "base"))
    end

    def bases(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::BaseCollection.new(self, parse_args(args).merge(tag_name: "base"))
    end

    def bdi(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "bdi"))
    end

    def bdis(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "bdi"))
    end

    def bdo(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "bdo"))
    end

    def bdos(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "bdo"))
    end

    def blockquote(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Quote.new(self, parse_args(args).merge(tag_name: "blockquote"))
    end

    def blockquotes(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::QuoteCollection.new(self, parse_args(args).merge(tag_name: "blockquote"))
    end

    def body(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Body.new(self, parse_args(args).merge(tag_name: "body"))
    end

    def bodys(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::BodyCollection.new(self, parse_args(args).merge(tag_name: "body"))
    end

    def br(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::BR.new(self, parse_args(args).merge(tag_name: "br"))
    end

    def brs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::BRCollection.new(self, parse_args(args).merge(tag_name: "br"))
    end

    def bs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "b"))
    end

    def button(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Button.new(self, parse_args(args).merge(tag_name: "button"))
    end

    def buttons(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ButtonCollection.new(self, parse_args(args).merge(tag_name: "button"))
    end

    def canvas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Canvas.new(self, parse_args(args).merge(tag_name: "canvas"))
    end

    def canvases(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CanvasCollection.new(self, parse_args(args).merge(tag_name: "canvas"))
    end

    def caption(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCaption.new(self, parse_args(args).merge(tag_name: "caption"))
    end

    def captions(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCaptionCollection.new(self, parse_args(args).merge(tag_name: "caption"))
    end

    def checkbox(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CheckBox.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def checkboxes(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CheckBoxCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def circle(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Circle.new(self, parse_args(args).merge(tag_name: "circle"))
    end

    def circles(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CircleCollection.new(self, parse_args(args).merge(tag_name: "circle"))
    end

    def cite(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "cite"))
    end

    def cites(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "cite"))
    end

    def code(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "code"))
    end

    def codes(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "code"))
    end

    def col(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCol.new(self, parse_args(args).merge(tag_name: "col"))
    end

    def colgroup(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCol.new(self, parse_args(args).merge(tag_name: "colgroup"))
    end

    def colgroups(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableColCollection.new(self, parse_args(args).merge(tag_name: "colgroup"))
    end

    def cols(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableColCollection.new(self, parse_args(args).merge(tag_name: "col"))
    end

    def cursor(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Cursor.new(self, parse_args(args).merge(tag_name: "cursor"))
    end

    def cursors(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CursorCollection.new(self, parse_args(args).merge(tag_name: "cursor"))
    end

    def data(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Data.new(self, parse_args(args).merge(tag_name: "data"))
    end

    def datalist(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataList.new(self, parse_args(args).merge(tag_name: "datalist"))
    end

    def datalists(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataListCollection.new(self, parse_args(args).merge(tag_name: "datalist"))
    end

    def datas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataCollection.new(self, parse_args(args).merge(tag_name: "data"))
    end

    def date_field(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_fields(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_time_field(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateTimeField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_time_fields(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateTimeFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def dd(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dd"))
    end

    def dds(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dd"))
    end

    def defs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Defs.new(self, parse_args(args).merge(tag_name: "defs"))
    end

    def defss(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DefsCollection.new(self, parse_args(args).merge(tag_name: "defs"))
    end

    def del(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mod.new(self, parse_args(args).merge(tag_name: "del"))
    end

    def dels(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ModCollection.new(self, parse_args(args).merge(tag_name: "del"))
    end

    def desc(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Desc.new(self, parse_args(args).merge(tag_name: "desc"))
    end

    def descs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DescCollection.new(self, parse_args(args).merge(tag_name: "desc"))
    end

    def details(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Details.new(self, parse_args(args).merge(tag_name: "details"))
    end

    def detailses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DetailsCollection.new(self, parse_args(args).merge(tag_name: "details"))
    end

    def dfn(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dfn"))
    end

    def dfns(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dfn"))
    end

    def div(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Div.new(self, parse_args(args).merge(tag_name: "div"))
    end

    def divs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DivCollection.new(self, parse_args(args).merge(tag_name: "div"))
    end

    def dl(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DList.new(self, parse_args(args).merge(tag_name: "dl"))
    end

    def dls(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::DListCollection.new(self, parse_args(args).merge(tag_name: "dl"))
    end

    def dt(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dt"))
    end

    def dts(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dt"))
    end

    def element(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args))
    end

    def elements(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args))
    end

    def ellipse(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Ellipse.new(self, parse_args(args).merge(tag_name: "ellipse"))
    end

    def ellipses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::EllipseCollection.new(self, parse_args(args).merge(tag_name: "ellipse"))
    end

    def em(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "em"))
    end

    def embed(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Embed.new(self, parse_args(args).merge(tag_name: "embed"))
    end

    def embeds(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::EmbedCollection.new(self, parse_args(args).merge(tag_name: "embed"))
    end

    def ems(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "em"))
    end

    def field_set(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSet.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def field_sets(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSetCollection.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def fieldset(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSet.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def fieldsets(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSetCollection.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def figcaption(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "figcaption"))
    end

    def figcaptions(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "figcaption"))
    end

    def figure(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "figure"))
    end

    def figures(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "figure"))
    end

    def file_field(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FileField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def file_fields(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FileFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def font(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Font.new(self, parse_args(args).merge(tag_name: "font"))
    end

    def fonts(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FontCollection.new(self, parse_args(args).merge(tag_name: "font"))
    end

    def footer(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "footer"))
    end

    def footers(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "footer"))
    end

    def foreign_object(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ForeignObject.new(self, parse_args(args).merge(tag_name: "foreignObject"))
    end

    def foreign_objects(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ForeignObjectCollection.new(self, parse_args(args).merge(tag_name: "foreignObject"))
    end

    def form(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Form.new(self, parse_args(args).merge(tag_name: "form"))
    end

    def forms(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FormCollection.new(self, parse_args(args).merge(tag_name: "form"))
    end

    def frame(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Frame.new(self, parse_args(args).merge(tag_name: "frame"))
    end

    def frames(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameCollection.new(self, parse_args(args).merge(tag_name: "frame"))
    end

    def frameset(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameSet.new(self, parse_args(args).merge(tag_name: "frameset"))
    end

    def framesets(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameSetCollection.new(self, parse_args(args).merge(tag_name: "frameset"))
    end

    def g(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::G.new(self, parse_args(args).merge(tag_name: "g"))
    end

    def gs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::GCollection.new(self, parse_args(args).merge(tag_name: "g"))
    end

    def h1(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h1"))
    end

    def h1s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h1"))
    end

    def h2(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h2"))
    end

    def h2s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h2"))
    end

    def h3(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h3"))
    end

    def h3s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h3"))
    end

    def h4(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h4"))
    end

    def h4s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h4"))
    end

    def h5(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h5"))
    end

    def h5s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h5"))
    end

    def h6(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h6"))
    end

    def h6s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h6"))
    end

    def hatchpath(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Hatchpath.new(self, parse_args(args).merge(tag_name: "hatchpath"))
    end

    def hatchpaths(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HatchpathCollection.new(self, parse_args(args).merge(tag_name: "hatchpath"))
    end

    def head(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Head.new(self, parse_args(args).merge(tag_name: "head"))
    end

    def header(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "header"))
    end

    def headers(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "header"))
    end

    def heads(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadCollection.new(self, parse_args(args).merge(tag_name: "head"))
    end

    def hidden(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Hidden.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def hiddens(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HiddenCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def hr(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HR.new(self, parse_args(args).merge(tag_name: "hr"))
    end

    def hrs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HRCollection.new(self, parse_args(args).merge(tag_name: "hr"))
    end

    def htmls(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HtmlCollection.new(self, parse_args(args).merge(tag_name: "html"))
    end

    def i(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "i"))
    end

    def iframe(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::IFrame.new(self, parse_args(args).merge(tag_name: "iframe"))
    end

    def iframes(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::IFrameCollection.new(self, parse_args(args).merge(tag_name: "iframe"))
    end

    def image(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Image.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def images(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ImageCollection.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def img(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Image.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def imgs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ImageCollection.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def input(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Input.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def inputs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::InputCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def ins(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mod.new(self, parse_args(args).merge(tag_name: "ins"))
    end

    def inses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ModCollection.new(self, parse_args(args).merge(tag_name: "ins"))
    end

    def is(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "i"))
    end

    def kbd(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "kbd"))
    end

    def kbds(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "kbd"))
    end

    def keygen(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Keygen.new(self, parse_args(args).merge(tag_name: "keygen"))
    end

    def keygens(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::KeygenCollection.new(self, parse_args(args).merge(tag_name: "keygen"))
    end

    def label(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Label.new(self, parse_args(args).merge(tag_name: "label"))
    end

    def labels(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LabelCollection.new(self, parse_args(args).merge(tag_name: "label"))
    end

    def legend(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Legend.new(self, parse_args(args).merge(tag_name: "legend"))
    end

    def legends(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LegendCollection.new(self, parse_args(args).merge(tag_name: "legend"))
    end

    def li(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LI.new(self, parse_args(args).merge(tag_name: "li"))
    end

    def line(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Line.new(self, parse_args(args).merge(tag_name: "line"))
    end

    def linear_gradient(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LinearGradient.new(self, parse_args(args).merge(tag_name: "linearGradient"))
    end

    def linear_gradients(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LinearGradientCollection.new(self, parse_args(args).merge(tag_name: "linearGradient"))
    end

    def lines(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LineCollection.new(self, parse_args(args).merge(tag_name: "line"))
    end

    def link(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Anchor.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def links(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::AnchorCollection.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def lis(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::LICollection.new(self, parse_args(args).merge(tag_name: "li"))
    end

    def main(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "main"))
    end

    def mains(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "main"))
    end

    def map(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Map.new(self, parse_args(args).merge(tag_name: "map"))
    end

    def maps(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MapCollection.new(self, parse_args(args).merge(tag_name: "map"))
    end

    def mark(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "mark"))
    end

    def marker(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Marker.new(self, parse_args(args).merge(tag_name: "marker"))
    end

    def markers(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MarkerCollection.new(self, parse_args(args).merge(tag_name: "marker"))
    end

    def marks(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "mark"))
    end

    def menu(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Menu.new(self, parse_args(args).merge(tag_name: "menu"))
    end

    def menuitem(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuItem.new(self, parse_args(args).merge(tag_name: "menuitem"))
    end

    def menuitems(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuItemCollection.new(self, parse_args(args).merge(tag_name: "menuitem"))
    end

    def menus(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuCollection.new(self, parse_args(args).merge(tag_name: "menu"))
    end

    def mesh(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mesh.new(self, parse_args(args).merge(tag_name: "mesh"))
    end

    def meshes(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshCollection.new(self, parse_args(args).merge(tag_name: "mesh"))
    end

    def meshgradient(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshGradient.new(self, parse_args(args).merge(tag_name: "meshgradient"))
    end

    def meshgradients(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshGradientCollection.new(self, parse_args(args).merge(tag_name: "meshgradient"))
    end

    def meshpatch(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meshpatch.new(self, parse_args(args).merge(tag_name: "meshpatch"))
    end

    def meshpatches(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshpatchCollection.new(self, parse_args(args).merge(tag_name: "meshpatch"))
    end

    def meshrow(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meshrow.new(self, parse_args(args).merge(tag_name: "meshrow"))
    end

    def meshrows(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshrowCollection.new(self, parse_args(args).merge(tag_name: "meshrow"))
    end

    def meta(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meta.new(self, parse_args(args).merge(tag_name: "meta"))
    end

    def metadata(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Metadata.new(self, parse_args(args).merge(tag_name: "metadata"))
    end

    def metadatas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MetadataCollection.new(self, parse_args(args).merge(tag_name: "metadata"))
    end

    def metas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MetaCollection.new(self, parse_args(args).merge(tag_name: "meta"))
    end

    def meter(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meter.new(self, parse_args(args).merge(tag_name: "meter"))
    end

    def meters(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeterCollection.new(self, parse_args(args).merge(tag_name: "meter"))
    end

    def nav(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "nav"))
    end

    def navs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "nav"))
    end

    def noscript(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "noscript"))
    end

    def noscripts(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "noscript"))
    end

    def object(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Object.new(self, parse_args(args).merge(tag_name: "object"))
    end

    def objects(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ObjectCollection.new(self, parse_args(args).merge(tag_name: "object"))
    end

    def ol(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OList.new(self, parse_args(args).merge(tag_name: "ol"))
    end

    def ols(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OListCollection.new(self, parse_args(args).merge(tag_name: "ol"))
    end

    def optgroup(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptGroup.new(self, parse_args(args).merge(tag_name: "optgroup"))
    end

    def optgroups(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptGroupCollection.new(self, parse_args(args).merge(tag_name: "optgroup"))
    end

    def option(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Option.new(self, parse_args(args).merge(tag_name: "option"))
    end

    def options(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptionCollection.new(self, parse_args(args).merge(tag_name: "option"))
    end

    def output(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Output.new(self, parse_args(args).merge(tag_name: "output"))
    end

    def outputs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::OutputCollection.new(self, parse_args(args).merge(tag_name: "output"))
    end

    def p(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Paragraph.new(self, parse_args(args).merge(tag_name: "p"))
    end

    def param(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Param.new(self, parse_args(args).merge(tag_name: "param"))
    end

    def params(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ParamCollection.new(self, parse_args(args).merge(tag_name: "param"))
    end

    def path(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Path.new(self, parse_args(args).merge(tag_name: "path"))
    end

    def paths(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PathCollection.new(self, parse_args(args).merge(tag_name: "path"))
    end

    def pattern(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Pattern.new(self, parse_args(args).merge(tag_name: "pattern"))
    end

    def patterns(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PatternCollection.new(self, parse_args(args).merge(tag_name: "pattern"))
    end

    def picture(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Picture.new(self, parse_args(args).merge(tag_name: "picture"))
    end

    def pictures(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PictureCollection.new(self, parse_args(args).merge(tag_name: "picture"))
    end

    def polygon(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Polygon.new(self, parse_args(args).merge(tag_name: "polygon"))
    end

    def polygons(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PolygonCollection.new(self, parse_args(args).merge(tag_name: "polygon"))
    end

    def polyline(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Polyline.new(self, parse_args(args).merge(tag_name: "polyline"))
    end

    def polylines(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PolylineCollection.new(self, parse_args(args).merge(tag_name: "polyline"))
    end

    def pre(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Pre.new(self, parse_args(args).merge(tag_name: "pre"))
    end

    def pres(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::PreCollection.new(self, parse_args(args).merge(tag_name: "pre"))
    end

    def progress(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Progress.new(self, parse_args(args).merge(tag_name: "progress"))
    end

    def progresses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ProgressCollection.new(self, parse_args(args).merge(tag_name: "progress"))
    end

    def ps(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ParagraphCollection.new(self, parse_args(args).merge(tag_name: "p"))
    end

    def q(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Quote.new(self, parse_args(args).merge(tag_name: "q"))
    end

    def qs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::QuoteCollection.new(self, parse_args(args).merge(tag_name: "q"))
    end

    def radial_gradient(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadialGradient.new(self, parse_args(args).merge(tag_name: "radialGradient"))
    end

    def radial_gradients(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadialGradientCollection.new(self, parse_args(args).merge(tag_name: "radialGradient"))
    end

    def radio(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Radio.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def radios(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadioCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def rb(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rb"))
    end

    def rbs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rb"))
    end

    def rect(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Rect.new(self, parse_args(args).merge(tag_name: "rect"))
    end

    def rects(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::RectCollection.new(self, parse_args(args).merge(tag_name: "rect"))
    end

    def rp(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rp"))
    end

    def rps(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rp"))
    end

    def rt(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rt"))
    end

    def rtc(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rtc"))
    end

    def rtcs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rtc"))
    end

    def rts(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rt"))
    end

    def rubies(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "ruby"))
    end

    def ruby(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "ruby"))
    end

    def s(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "s"))
    end

    def samp(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "samp"))
    end

    def samps(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "samp"))
    end

    def script(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Script.new(self, parse_args(args).merge(tag_name: "script"))
    end

    def scripts(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ScriptCollection.new(self, parse_args(args).merge(tag_name: "script"))
    end

    def section(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "section"))
    end

    def sections(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "section"))
    end

    def select(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Select.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def select_list(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Select.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def select_lists(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SelectCollection.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def selects(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SelectCollection.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def small(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "small"))
    end

    def smalls(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "small"))
    end

    def solidcolor(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Solidcolor.new(self, parse_args(args).merge(tag_name: "solidcolor"))
    end

    def solidcolors(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SolidcolorCollection.new(self, parse_args(args).merge(tag_name: "solidcolor"))
    end

    def source(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Source.new(self, parse_args(args).merge(tag_name: "source"))
    end

    def sources(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SourceCollection.new(self, parse_args(args).merge(tag_name: "source"))
    end

    def span(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Span.new(self, parse_args(args).merge(tag_name: "span"))
    end

    def spans(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SpanCollection.new(self, parse_args(args).merge(tag_name: "span"))
    end

    def ss(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "s"))
    end

    def stop(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Stop.new(self, parse_args(args).merge(tag_name: "stop"))
    end

    def stops(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::StopCollection.new(self, parse_args(args).merge(tag_name: "stop"))
    end

    def strong(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "strong"))
    end

    def strongs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "strong"))
    end

    def style(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Style.new(self, parse_args(args).merge(tag_name: "style"))
    end

    def styles(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::StyleCollection.new(self, parse_args(args).merge(tag_name: "style"))
    end

    def sub(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "sub"))
    end

    def subs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "sub"))
    end

    def summaries(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "summary"))
    end

    def summary(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "summary"))
    end

    def sup(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "sup"))
    end

    def sups(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "sup"))
    end

    def svg(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SVG.new(self, parse_args(args).merge(tag_name: "svg"))
    end

    def svgs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SVGCollection.new(self, parse_args(args).merge(tag_name: "svg"))
    end

    def switch(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Switch.new(self, parse_args(args).merge(tag_name: "switch"))
    end

    def switches(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SwitchCollection.new(self, parse_args(args).merge(tag_name: "switch"))
    end

    def symbol(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Symbol.new(self, parse_args(args).merge(tag_name: "symbol"))
    end

    def symbols(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::SymbolCollection.new(self, parse_args(args).merge(tag_name: "symbol"))
    end

    def table(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Table.new(self, parse_args(args).merge(tag_name: "table"))
    end

    def tables(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCollection.new(self, parse_args(args).merge(tag_name: "table"))
    end

    def tbody(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "tbody"))
    end

    def tbodys(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "tbody"))
    end

    def td(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableDataCell.new(self, parse_args(args).merge(tag_name: "td"))
    end

    def tds(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableDataCellCollection.new(self, parse_args(args).merge(tag_name: "td"))
    end

    def template(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Template.new(self, parse_args(args).merge(tag_name: "template"))
    end

    def templates(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TemplateCollection.new(self, parse_args(args).merge(tag_name: "template"))
    end

    def text_field(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def text_fields(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def text_path(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextPath.new(self, parse_args(args).merge(tag_name: "textPath"))
    end

    def text_paths(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextPathCollection.new(self, parse_args(args).merge(tag_name: "textPath"))
    end

    def textarea(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextArea.new(self, parse_args(args).merge(tag_name: "textarea"))
    end

    def textareas(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextAreaCollection.new(self, parse_args(args).merge(tag_name: "textarea"))
    end

    def tfoot(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "tfoot"))
    end

    def tfoots(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "tfoot"))
    end

    def th(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableHeaderCell.new(self, parse_args(args).merge(tag_name: "th"))
    end

    def thead(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "thead"))
    end

    def theads(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "thead"))
    end

    def ths(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableHeaderCellCollection.new(self, parse_args(args).merge(tag_name: "th"))
    end

    def time(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Time.new(self, parse_args(args).merge(tag_name: "time"))
    end

    def times(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TimeCollection.new(self, parse_args(args).merge(tag_name: "time"))
    end

    def titles(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TitleCollection.new(self, parse_args(args).merge(tag_name: "title"))
    end

    def tr(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableRow.new(self, parse_args(args).merge(tag_name: "tr"))
    end

    def track(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Track.new(self, parse_args(args).merge(tag_name: "track"))
    end

    def tracks(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TrackCollection.new(self, parse_args(args).merge(tag_name: "track"))
    end

    def trs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableRowCollection.new(self, parse_args(args).merge(tag_name: "tr"))
    end

    def tspan(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TSpan.new(self, parse_args(args).merge(tag_name: "tspan"))
    end

    def tspans(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::TSpanCollection.new(self, parse_args(args).merge(tag_name: "tspan"))
    end

    def u(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "u"))
    end

    def ul(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::UList.new(self, parse_args(args).merge(tag_name: "ul"))
    end

    def uls(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::UListCollection.new(self, parse_args(args).merge(tag_name: "ul"))
    end

    def us(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "u"))
    end

    def use(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Use.new(self, parse_args(args).merge(tag_name: "use"))
    end

    def uses(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::UseCollection.new(self, parse_args(args).merge(tag_name: "use"))
    end

    def var(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "var"))
    end

    def vars(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "var"))
    end

    def video(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Video.new(self, parse_args(args).merge(tag_name: "video"))
    end

    def videos(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::VideoCollection.new(self, parse_args(args).merge(tag_name: "video"))
    end

    def view(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::View.new(self, parse_args(args).merge(tag_name: "view"))
    end

    def views(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::ViewCollection.new(self, parse_args(args).merge(tag_name: "view"))
    end

    def wbr(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "wbr"))
    end

    def wbrs(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "wbr"))
    end

    def cell(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Cell.new(self, parse_args(args))
    end

    def cells(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::CellCollection.new(self, parse_args(args))
    end

    def row(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::Row.new(self, parse_args(args))
    end

    def rows(*args)
      # respond_to?(:target) ? obj = self : obj = @browser
      Insite::RowCollection.new(self, parse_args(args))
    end

  end
end
