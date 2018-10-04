module Insite
  module ElementInstanceMethods
    def a(*args)
      Insite::Anchor.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def abbr(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "abbr"))
    end

    def abbrs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "abbr"))
    end

    def address(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "address"))
    end

    def addresses(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "address"))
    end

    def area(*args)
      Insite::Area.new(self, parse_args(args).merge(tag_name: "area"))
    end

    def areas(*args)
      Insite::AreaCollection.new(self, parse_args(args).merge(tag_name: "area"))
    end

    def article(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "article"))
    end

    def articles(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "article"))
    end

    def as(*args)
      Insite::AnchorCollection.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def aside(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "aside"))
    end

    def asides(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "aside"))
    end

    def audio(*args)
      Insite::Audio.new(self, parse_args(args).merge(tag_name: "audio"))
    end

    def audios(*args)
      Insite::AudioCollection.new(self, parse_args(args).merge(tag_name: "audio"))
    end

    def b(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "b"))
    end

    def base(*args)
      Insite::Base.new(self, parse_args(args).merge(tag_name: "base"))
    end

    def bases(*args)
      Insite::BaseCollection.new(self, parse_args(args).merge(tag_name: "base"))
    end

    def bdi(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "bdi"))
    end

    def bdis(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "bdi"))
    end

    def bdo(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "bdo"))
    end

    def bdos(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "bdo"))
    end

    def blockquote(*args)
      Insite::Quote.new(self, parse_args(args).merge(tag_name: "blockquote"))
    end

    def blockquotes(*args)
      Insite::QuoteCollection.new(self, parse_args(args).merge(tag_name: "blockquote"))
    end

    def body(*args)
      Insite::Body.new(self, parse_args(args).merge(tag_name: "body"))
    end

    def bodys(*args)
      Insite::BodyCollection.new(self, parse_args(args).merge(tag_name: "body"))
    end

    def br(*args)
      Insite::BR.new(self, parse_args(args).merge(tag_name: "br"))
    end

    def brs(*args)
      Insite::BRCollection.new(self, parse_args(args).merge(tag_name: "br"))
    end

    def bs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "b"))
    end

    def button(*args)
      Insite::Button.new(self, parse_args(args).merge(tag_name: "button"))
    end

    def buttons(*args)
      Insite::ButtonCollection.new(self, parse_args(args).merge(tag_name: "button"))
    end

    def canvas(*args)
      Insite::Canvas.new(self, parse_args(args).merge(tag_name: "canvas"))
    end

    def canvases(*args)
      Insite::CanvasCollection.new(self, parse_args(args).merge(tag_name: "canvas"))
    end

    def caption(*args)
      Insite::TableCaption.new(self, parse_args(args).merge(tag_name: "caption"))
    end

    def captions(*args)
      Insite::TableCaptionCollection.new(self, parse_args(args).merge(tag_name: "caption"))
    end

    def checkbox(*args)
      Insite::CheckBox.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def checkboxes(*args)
      Insite::CheckBoxCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def circle(*args)
      Insite::Circle.new(self, parse_args(args).merge(tag_name: "circle"))
    end

    def circles(*args)
      Insite::CircleCollection.new(self, parse_args(args).merge(tag_name: "circle"))
    end

    def cite(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "cite"))
    end

    def cites(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "cite"))
    end

    def code(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "code"))
    end

    def codes(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "code"))
    end

    def col(*args)
      Insite::TableCol.new(self, parse_args(args).merge(tag_name: "col"))
    end

    def colgroup(*args)
      Insite::TableCol.new(self, parse_args(args).merge(tag_name: "colgroup"))
    end

    def colgroups(*args)
      Insite::TableColCollection.new(self, parse_args(args).merge(tag_name: "colgroup"))
    end

    def cols(*args)
      Insite::TableColCollection.new(self, parse_args(args).merge(tag_name: "col"))
    end

    def data(*args)
      Insite::Data.new(self, parse_args(args).merge(tag_name: "data"))
    end

    def datalist(*args)
      Insite::DataList.new(self, parse_args(args).merge(tag_name: "datalist"))
    end

    def datalists(*args)
      Insite::DataListCollection.new(self, parse_args(args).merge(tag_name: "datalist"))
    end

    def datas(*args)
      Insite::DataCollection.new(self, parse_args(args).merge(tag_name: "data"))
    end

    def date_field(*args)
      Insite::DateField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_fields(*args)
      Insite::DateFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_time_field(*args)
      Insite::DateTimeField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def date_time_fields(*args)
      Insite::DateTimeFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def dd(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dd"))
    end

    def dds(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dd"))
    end

    def defs(*args)
      Insite::Defs.new(self, parse_args(args).merge(tag_name: "defs"))
    end

    def defss(*args)
      Insite::DefsCollection.new(self, parse_args(args).merge(tag_name: "defs"))
    end

    def del(*args)
      Insite::Mod.new(self, parse_args(args).merge(tag_name: "del"))
    end

    def dels(*args)
      Insite::ModCollection.new(self, parse_args(args).merge(tag_name: "del"))
    end

    def desc(*args)
      Insite::Desc.new(self, parse_args(args).merge(tag_name: "desc"))
    end

    def descs(*args)
      Insite::DescCollection.new(self, parse_args(args).merge(tag_name: "desc"))
    end

    def details(*args)
      Insite::Details.new(self, parse_args(args).merge(tag_name: "details"))
    end

    def detailses(*args)
      Insite::DetailsCollection.new(self, parse_args(args).merge(tag_name: "details"))
    end

    def dfn(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dfn"))
    end

    def dfns(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dfn"))
    end

    def div(*args)
      Insite::Div.new(self, parse_args(args).merge(tag_name: "div"))
    end

    def divs(*args)
      Insite::DivCollection.new(self, parse_args(args).merge(tag_name: "div"))
    end

    def dl(*args)
      Insite::DList.new(self, parse_args(args).merge(tag_name: "dl"))
    end

    def dls(*args)
      Insite::DListCollection.new(self, parse_args(args).merge(tag_name: "dl"))
    end

    def dt(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "dt"))
    end

    def dts(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "dt"))
    end

    def element(*args)
      Insite::HTMLElement.new(self, parse_args(args))
    end

    def elements(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args))
    end

    def ellipse(*args)
      Insite::Ellipse.new(self, parse_args(args).merge(tag_name: "ellipse"))
    end

    def ellipses(*args)
      Insite::EllipseCollection.new(self, parse_args(args).merge(tag_name: "ellipse"))
    end

    def em(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "em"))
    end

    def embed(*args)
      Insite::Embed.new(self, parse_args(args).merge(tag_name: "embed"))
    end

    def embeds(*args)
      Insite::EmbedCollection.new(self, parse_args(args).merge(tag_name: "embed"))
    end

    def ems(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "em"))
    end

    def field_set(*args)
      Insite::FieldSet.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def field_sets(*args)
      Insite::FieldSetCollection.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def fieldset(*args)
      Insite::FieldSet.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def fieldsets(*args)
      Insite::FieldSetCollection.new(self, parse_args(args).merge(tag_name: "fieldset"))
    end

    def figcaption(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "figcaption"))
    end

    def figcaptions(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "figcaption"))
    end

    def figure(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "figure"))
    end

    def figures(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "figure"))
    end

    def file_field(*args)
      Insite::FileField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def file_fields(*args)
      Insite::FileFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def font(*args)
      Insite::Font.new(self, parse_args(args).merge(tag_name: "font"))
    end

    def fonts(*args)
      Insite::FontCollection.new(self, parse_args(args).merge(tag_name: "font"))
    end

    def footer(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "footer"))
    end

    def footers(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "footer"))
    end

    def foreign_object(*args)
      Insite::ForeignObject.new(self, parse_args(args).merge(tag_name: "foreignObject"))
    end

    def foreign_objects(*args)
      Insite::ForeignObjectCollection.new(self, parse_args(args).merge(tag_name: "foreignObject"))
    end

    def form(*args)
      Insite::Form.new(self, parse_args(args).merge(tag_name: "form"))
    end

    def forms(*args)
      Insite::FormCollection.new(self, parse_args(args).merge(tag_name: "form"))
    end

    def frame(*args)
      Insite::Frame.new(self, parse_args(args).merge(tag_name: "frame"))
    end

    def frames(*args)
      Insite::FrameCollection.new(self, parse_args(args).merge(tag_name: "frame"))
    end

    def frameset(*args)
      Insite::FrameSet.new(self, parse_args(args).merge(tag_name: "frameset"))
    end

    def framesets(*args)
      Insite::FrameSetCollection.new(self, parse_args(args).merge(tag_name: "frameset"))
    end

    def g(*args)
      Insite::G.new(self, parse_args(args).merge(tag_name: "g"))
    end

    def gs(*args)
      Insite::GCollection.new(self, parse_args(args).merge(tag_name: "g"))
    end

    def h1(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h1"))
    end

    def h1s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h1"))
    end

    def h2(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h2"))
    end

    def h2s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h2"))
    end

    def h3(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h3"))
    end

    def h3s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h3"))
    end

    def h4(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h4"))
    end

    def h4s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h4"))
    end

    def h5(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h5"))
    end

    def h5s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h5"))
    end

    def h6(*args)
      Insite::Heading.new(self, parse_args(args).merge(tag_name: "h6"))
    end

    def h6s(*args)
      Insite::HeadingCollection.new(self, parse_args(args).merge(tag_name: "h6"))
    end

    def head(*args)
      Insite::Head.new(self, parse_args(args).merge(tag_name: "head"))
    end

    def header(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "header"))
    end

    def headers(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "header"))
    end

    def heads(*args)
      Insite::HeadCollection.new(self, parse_args(args).merge(tag_name: "head"))
    end

    def hidden(*args)
      Insite::Hidden.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def hiddens(*args)
      Insite::HiddenCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def hr(*args)
      Insite::HR.new(self, parse_args(args).merge(tag_name: "hr"))
    end

    def hrs(*args)
      Insite::HRCollection.new(self, parse_args(args).merge(tag_name: "hr"))
    end

    def htmls(*args)
      Insite::HtmlCollection.new(self, parse_args(args).merge(tag_name: "html"))
    end

    def i(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "i"))
    end

    def iframe(*args)
      Insite::IFrame.new(self, parse_args(args).merge(tag_name: "iframe"))
    end

    def iframes(*args)
      Insite::IFrameCollection.new(self, parse_args(args).merge(tag_name: "iframe"))
    end

    def image(*args)
      Insite::Image.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def images(*args)
      Insite::ImageCollection.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def img(*args)
      Insite::Image.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def imgs(*args)
      Insite::ImageCollection.new(self, parse_args(args).merge(tag_name: "img"))
    end

    def input(*args)
      Insite::Input.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def inputs(*args)
      Insite::InputCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def ins(*args)
      Insite::Mod.new(self, parse_args(args).merge(tag_name: "ins"))
    end

    def inses(*args)
      Insite::ModCollection.new(self, parse_args(args).merge(tag_name: "ins"))
    end

    def is(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "i"))
    end

    def kbd(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "kbd"))
    end

    def kbds(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "kbd"))
    end

    def label(*args)
      Insite::Label.new(self, parse_args(args).merge(tag_name: "label"))
    end

    def labels(*args)
      Insite::LabelCollection.new(self, parse_args(args).merge(tag_name: "label"))
    end

    def legend(*args)
      Insite::Legend.new(self, parse_args(args).merge(tag_name: "legend"))
    end

    def legends(*args)
      Insite::LegendCollection.new(self, parse_args(args).merge(tag_name: "legend"))
    end

    def li(*args)
      Insite::LI.new(self, parse_args(args).merge(tag_name: "li"))
    end

    def line(*args)
      Insite::Line.new(self, parse_args(args).merge(tag_name: "line"))
    end

    def linear_gradient(*args)
      Insite::LinearGradient.new(self, parse_args(args).merge(tag_name: "linearGradient"))
    end

    def linear_gradients(*args)
      Insite::LinearGradientCollection.new(self, parse_args(args).merge(tag_name: "linearGradient"))
    end

    def lines(*args)
      Insite::LineCollection.new(self, parse_args(args).merge(tag_name: "line"))
    end

    def link(*args)
      Insite::Anchor.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def links(*args)
      Insite::AnchorCollection.new(self, parse_args(args).merge(tag_name: "a"))
    end

    def lis(*args)
      Insite::LICollection.new(self, parse_args(args).merge(tag_name: "li"))
    end

    def main(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "main"))
    end

    def mains(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "main"))
    end

    def map(*args)
      Insite::Map.new(self, parse_args(args).merge(tag_name: "map"))
    end

    def maps(*args)
      Insite::MapCollection.new(self, parse_args(args).merge(tag_name: "map"))
    end

    def mark(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "mark"))
    end

    def marker(*args)
      Insite::Marker.new(self, parse_args(args).merge(tag_name: "marker"))
    end

    def markers(*args)
      Insite::MarkerCollection.new(self, parse_args(args).merge(tag_name: "marker"))
    end

    def marks(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "mark"))
    end

    def meta(*args)
      Insite::Meta.new(self, parse_args(args).merge(tag_name: "meta"))
    end

    def metadata(*args)
      Insite::Metadata.new(self, parse_args(args).merge(tag_name: "metadata"))
    end

    def metadatas(*args)
      Insite::MetadataCollection.new(self, parse_args(args).merge(tag_name: "metadata"))
    end

    def metas(*args)
      Insite::MetaCollection.new(self, parse_args(args).merge(tag_name: "meta"))
    end

    def meter(*args)
      Insite::Meter.new(self, parse_args(args).merge(tag_name: "meter"))
    end

    def meters(*args)
      Insite::MeterCollection.new(self, parse_args(args).merge(tag_name: "meter"))
    end

    def nav(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "nav"))
    end

    def navs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "nav"))
    end

    def noscript(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "noscript"))
    end

    def noscripts(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "noscript"))
    end

    def object(*args)
      Insite::Object.new(self, parse_args(args).merge(tag_name: "object"))
    end

    def objects(*args)
      Insite::ObjectCollection.new(self, parse_args(args).merge(tag_name: "object"))
    end

    def ol(*args)
      Insite::OList.new(self, parse_args(args).merge(tag_name: "ol"))
    end

    def ols(*args)
      Insite::OListCollection.new(self, parse_args(args).merge(tag_name: "ol"))
    end

    def optgroup(*args)
      Insite::OptGroup.new(self, parse_args(args).merge(tag_name: "optgroup"))
    end

    def optgroups(*args)
      Insite::OptGroupCollection.new(self, parse_args(args).merge(tag_name: "optgroup"))
    end

    def option(*args)
      Insite::Option.new(self, parse_args(args).merge(tag_name: "option"))
    end

    def options(*args)
      Insite::OptionCollection.new(self, parse_args(args).merge(tag_name: "option"))
    end

    def output(*args)
      Insite::Output.new(self, parse_args(args).merge(tag_name: "output"))
    end

    def outputs(*args)
      Insite::OutputCollection.new(self, parse_args(args).merge(tag_name: "output"))
    end

    def p(*args)
      Insite::Paragraph.new(self, parse_args(args).merge(tag_name: "p"))
    end

    def param(*args)
      Insite::Param.new(self, parse_args(args).merge(tag_name: "param"))
    end

    def params(*args)
      Insite::ParamCollection.new(self, parse_args(args).merge(tag_name: "param"))
    end

    def path(*args)
      Insite::Path.new(self, parse_args(args).merge(tag_name: "path"))
    end

    def paths(*args)
      Insite::PathCollection.new(self, parse_args(args).merge(tag_name: "path"))
    end

    def pattern(*args)
      Insite::Pattern.new(self, parse_args(args).merge(tag_name: "pattern"))
    end

    def patterns(*args)
      Insite::PatternCollection.new(self, parse_args(args).merge(tag_name: "pattern"))
    end

    def picture(*args)
      Insite::Picture.new(self, parse_args(args).merge(tag_name: "picture"))
    end

    def pictures(*args)
      Insite::PictureCollection.new(self, parse_args(args).merge(tag_name: "picture"))
    end

    def polygon(*args)
      Insite::Polygon.new(self, parse_args(args).merge(tag_name: "polygon"))
    end

    def polygons(*args)
      Insite::PolygonCollection.new(self, parse_args(args).merge(tag_name: "polygon"))
    end

    def polyline(*args)
      Insite::Polyline.new(self, parse_args(args).merge(tag_name: "polyline"))
    end

    def polylines(*args)
      Insite::PolylineCollection.new(self, parse_args(args).merge(tag_name: "polyline"))
    end

    def pre(*args)
      Insite::Pre.new(self, parse_args(args).merge(tag_name: "pre"))
    end

    def pres(*args)
      Insite::PreCollection.new(self, parse_args(args).merge(tag_name: "pre"))
    end

    def progress(*args)
      Insite::Progress.new(self, parse_args(args).merge(tag_name: "progress"))
    end

    def progresses(*args)
      Insite::ProgressCollection.new(self, parse_args(args).merge(tag_name: "progress"))
    end

    def ps(*args)
      Insite::ParagraphCollection.new(self, parse_args(args).merge(tag_name: "p"))
    end

    def q(*args)
      Insite::Quote.new(self, parse_args(args).merge(tag_name: "q"))
    end

    def qs(*args)
      Insite::QuoteCollection.new(self, parse_args(args).merge(tag_name: "q"))
    end

    def radial_gradient(*args)
      Insite::RadialGradient.new(self, parse_args(args).merge(tag_name: "radialGradient"))
    end

    def radial_gradients(*args)
      Insite::RadialGradientCollection.new(self, parse_args(args).merge(tag_name: "radialGradient"))
    end

    def radio(*args)
      Insite::Radio.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def radios(*args)
      Insite::RadioCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def rb(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rb"))
    end

    def rbs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rb"))
    end

    def rect(*args)
      Insite::Rect.new(self, parse_args(args).merge(tag_name: "rect"))
    end

    def rects(*args)
      Insite::RectCollection.new(self, parse_args(args).merge(tag_name: "rect"))
    end

    def rp(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rp"))
    end

    def rps(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rp"))
    end

    def rt(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rt"))
    end

    def rtc(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "rtc"))
    end

    def rtcs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rtc"))
    end

    def rts(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "rt"))
    end

    def rubies(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "ruby"))
    end

    def ruby(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "ruby"))
    end

    def s(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "s"))
    end

    def samp(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "samp"))
    end

    def samps(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "samp"))
    end

    def script(*args)
      Insite::Script.new(self, parse_args(args).merge(tag_name: "script"))
    end

    def scripts(*args)
      Insite::ScriptCollection.new(self, parse_args(args).merge(tag_name: "script"))
    end

    def section(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "section"))
    end

    def sections(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "section"))
    end

    def select(*args)
      Insite::Select.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def select_list(*args)
      Insite::Select.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def select_lists(*args)
      Insite::SelectCollection.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def selects(*args)
      Insite::SelectCollection.new(self, parse_args(args).merge(tag_name: "select"))
    end

    def small(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "small"))
    end

    def smalls(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "small"))
    end

    def source(*args)
      Insite::Source.new(self, parse_args(args).merge(tag_name: "source"))
    end

    def sources(*args)
      Insite::SourceCollection.new(self, parse_args(args).merge(tag_name: "source"))
    end

    def span(*args)
      Insite::Span.new(self, parse_args(args).merge(tag_name: "span"))
    end

    def spans(*args)
      Insite::SpanCollection.new(self, parse_args(args).merge(tag_name: "span"))
    end

    def ss(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "s"))
    end

    def stop(*args)
      Insite::Stop.new(self, parse_args(args).merge(tag_name: "stop"))
    end

    def stops(*args)
      Insite::StopCollection.new(self, parse_args(args).merge(tag_name: "stop"))
    end

    def strong(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "strong"))
    end

    def strongs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "strong"))
    end

    def style(*args)
      Insite::Style.new(self, parse_args(args).merge(tag_name: "style"))
    end

    def styles(*args)
      Insite::StyleCollection.new(self, parse_args(args).merge(tag_name: "style"))
    end

    def sub(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "sub"))
    end

    def subs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "sub"))
    end

    def summaries(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "summary"))
    end

    def summary(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "summary"))
    end

    def sup(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "sup"))
    end

    def sups(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "sup"))
    end

    def svg(*args)
      Insite::SVG.new(self, parse_args(args).merge(tag_name: "svg"))
    end

    def svgs(*args)
      Insite::SVGCollection.new(self, parse_args(args).merge(tag_name: "svg"))
    end

    def switch(*args)
      Insite::Switch.new(self, parse_args(args).merge(tag_name: "switch"))
    end

    def switches(*args)
      Insite::SwitchCollection.new(self, parse_args(args).merge(tag_name: "switch"))
    end

    def symbol(*args)
      Insite::Symbol.new(self, parse_args(args).merge(tag_name: "symbol"))
    end

    def symbols(*args)
      Insite::SymbolCollection.new(self, parse_args(args).merge(tag_name: "symbol"))
    end

    def table(*args)
      Insite::Table.new(self, parse_args(args).merge(tag_name: "table"))
    end

    def tables(*args)
      Insite::TableCollection.new(self, parse_args(args).merge(tag_name: "table"))
    end

    def tbody(*args)
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "tbody"))
    end

    def tbodys(*args)
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "tbody"))
    end

    def td(*args)
      Insite::TableDataCell.new(self, parse_args(args).merge(tag_name: "td"))
    end

    def tds(*args)
      Insite::TableDataCellCollection.new(self, parse_args(args).merge(tag_name: "td"))
    end

    def template(*args)
      Insite::Template.new(self, parse_args(args).merge(tag_name: "template"))
    end

    def templates(*args)
      Insite::TemplateCollection.new(self, parse_args(args).merge(tag_name: "template"))
    end

    def text_field(*args)
      Insite::TextField.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def text_fields(*args)
      Insite::TextFieldCollection.new(self, parse_args(args).merge(tag_name: "input"))
    end

    def text_path(*args)
      Insite::TextPath.new(self, parse_args(args).merge(tag_name: "textPath"))
    end

    def text_paths(*args)
      Insite::TextPathCollection.new(self, parse_args(args).merge(tag_name: "textPath"))
    end

    def textarea(*args)
      Insite::TextArea.new(self, parse_args(args).merge(tag_name: "textarea"))
    end

    def textareas(*args)
      Insite::TextAreaCollection.new(self, parse_args(args).merge(tag_name: "textarea"))
    end

    def tfoot(*args)
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "tfoot"))
    end

    def tfoots(*args)
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "tfoot"))
    end

    def th(*args)
      Insite::TableHeaderCell.new(self, parse_args(args).merge(tag_name: "th"))
    end

    def thead(*args)
      Insite::TableSection.new(self, parse_args(args).merge(tag_name: "thead"))
    end

    def theads(*args)
      Insite::TableSectionCollection.new(self, parse_args(args).merge(tag_name: "thead"))
    end

    def ths(*args)
      Insite::TableHeaderCellCollection.new(self, parse_args(args).merge(tag_name: "th"))
    end

    def time(*args)
      Insite::Time.new(self, parse_args(args).merge(tag_name: "time"))
    end

    def times(*args)
      Insite::TimeCollection.new(self, parse_args(args).merge(tag_name: "time"))
    end

    def titles(*args)
      Insite::TitleCollection.new(self, parse_args(args).merge(tag_name: "title"))
    end

    def tr(*args)
      Insite::TableRow.new(self, parse_args(args).merge(tag_name: "tr"))
    end

    def track(*args)
      Insite::Track.new(self, parse_args(args).merge(tag_name: "track"))
    end

    def tracks(*args)
      Insite::TrackCollection.new(self, parse_args(args).merge(tag_name: "track"))
    end

    def trs(*args)
      Insite::TableRowCollection.new(self, parse_args(args).merge(tag_name: "tr"))
    end

    def tspan(*args)
      Insite::TSpan.new(self, parse_args(args).merge(tag_name: "tspan"))
    end

    def tspans(*args)
      Insite::TSpanCollection.new(self, parse_args(args).merge(tag_name: "tspan"))
    end

    def u(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "u"))
    end

    def ul(*args)
      Insite::UList.new(self, parse_args(args).merge(tag_name: "ul"))
    end

    def uls(*args)
      Insite::UListCollection.new(self, parse_args(args).merge(tag_name: "ul"))
    end

    def us(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "u"))
    end

    def use(*args)
      Insite::Use.new(self, parse_args(args).merge(tag_name: "use"))
    end

    def uses(*args)
      Insite::UseCollection.new(self, parse_args(args).merge(tag_name: "use"))
    end

    def var(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "var"))
    end

    def vars(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "var"))
    end

    def video(*args)
      Insite::Video.new(self, parse_args(args).merge(tag_name: "video"))
    end

    def videos(*args)
      Insite::VideoCollection.new(self, parse_args(args).merge(tag_name: "video"))
    end

    def view(*args)
      Insite::View.new(self, parse_args(args).merge(tag_name: "view"))
    end

    def views(*args)
      Insite::ViewCollection.new(self, parse_args(args).merge(tag_name: "view"))
    end

    def wbr(*args)
      Insite::HTMLElement.new(self, parse_args(args).merge(tag_name: "wbr"))
    end

    def wbrs(*args)
      Insite::HTMLElementCollection.new(self, parse_args(args).merge(tag_name: "wbr"))
    end

    def cell(*args)
      Insite::Cell.new(self, parse_args(args))
    end

    def cells(*args)
      Insite::CellCollection.new(self, parse_args(args))
    end

    def row(*args)
      Insite::Row.new(self, parse_args(args))
    end

    def rows(*args)
      Insite::RowCollection.new(self, parse_args(args))
    end

  end
end
