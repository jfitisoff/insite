module Insite
  module ElementInstanceMethods
    def a(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Anchor.new(obj, *args)
    end

    def abbr(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def abbrs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def address(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def addresses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def area(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Area.new(obj, *args)
    end

    def areas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::AreaCollection.new(obj, *args)
    end

    def article(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def articles(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def as(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::AnchorCollection.new(obj, *args)
    end

    def aside(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def asides(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def audio(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Audio.new(obj, *args)
    end

    def audios(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::AudioCollection.new(obj, *args)
    end

    def b(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def base(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Base.new(obj, *args)
    end

    def bases(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::BaseCollection.new(obj, *args)
    end

    def bdi(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def bdis(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def bdo(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def bdos(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def blockquote(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Quote.new(obj, *args)
    end

    def blockquotes(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::QuoteCollection.new(obj, *args)
    end

    def body(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Body.new(obj, *args)
    end

    def bodys(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::BodyCollection.new(obj, *args)
    end

    def br(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::BR.new(obj, *args)
    end

    def brs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::BRCollection.new(obj, *args)
    end

    def bs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def button(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Button.new(obj, *args)
    end

    def buttons(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ButtonCollection.new(obj, *args)
    end

    def canvas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Canvas.new(obj, *args)
    end

    def canvases(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CanvasCollection.new(obj, *args)
    end

    def caption(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCaption.new(obj, *args)
    end

    def captions(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCaptionCollection.new(obj, *args)
    end

    def checkbox(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CheckBox.new(obj, *args)
    end

    def checkboxes(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CheckBoxCollection.new(obj, *args)
    end

    def circle(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Circle.new(obj, *args)
    end

    def circles(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CircleCollection.new(obj, *args)
    end

    def cite(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def cites(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def code(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def codes(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def col(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCol.new(obj, *args)
    end

    def colgroup(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCol.new(obj, *args)
    end

    def colgroups(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableColCollection.new(obj, *args)
    end

    def cols(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableColCollection.new(obj, *args)
    end

    def cursor(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Cursor.new(obj, *args)
    end

    def cursors(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CursorCollection.new(obj, *args)
    end

    def data(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Data.new(obj, *args)
    end

    def datalist(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataList.new(obj, *args)
    end

    def datalists(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataListCollection.new(obj, *args)
    end

    def datas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DataCollection.new(obj, *args)
    end

    def date_field(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateField.new(obj, *args)
    end

    def date_fields(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateFieldCollection.new(obj, *args)
    end

    def date_time_field(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateTimeField.new(obj, *args)
    end

    def date_time_fields(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DateTimeFieldCollection.new(obj, *args)
    end

    def dd(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def dds(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def defs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Defs.new(obj, *args)
    end

    def defss(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DefsCollection.new(obj, *args)
    end

    def del(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mod.new(obj, *args)
    end

    def dels(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ModCollection.new(obj, *args)
    end

    def desc(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Desc.new(obj, *args)
    end

    def descs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DescCollection.new(obj, *args)
    end

    def details(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Details.new(obj, *args)
    end

    def detailses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DetailsCollection.new(obj, *args)
    end

    def dfn(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def dfns(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def div(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Div.new(obj, *args)
    end

    def divs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DivCollection.new(obj, *args)
    end

    def dl(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DList.new(obj, *args)
    end

    def dls(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::DListCollection.new(obj, *args)
    end

    def dt(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def dts(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def element(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def elements(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def ellipse(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Ellipse.new(obj, *args)
    end

    def ellipses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::EllipseCollection.new(obj, *args)
    end

    def em(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def embed(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Embed.new(obj, *args)
    end

    def embeds(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::EmbedCollection.new(obj, *args)
    end

    def ems(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def field_set(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSet.new(obj, *args)
    end

    def field_sets(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSetCollection.new(obj, *args)
    end

    def fieldset(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSet.new(obj, *args)
    end

    def fieldsets(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FieldSetCollection.new(obj, *args)
    end

    def figcaption(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def figcaptions(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def figure(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def figures(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def file_field(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FileField.new(obj, *args)
    end

    def file_fields(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FileFieldCollection.new(obj, *args)
    end

    def font(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Font.new(obj, *args)
    end

    def fonts(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FontCollection.new(obj, *args)
    end

    def footer(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def footers(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def foreign_object(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ForeignObject.new(obj, *args)
    end

    def foreign_objects(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ForeignObjectCollection.new(obj, *args)
    end

    def form(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Form.new(obj, *args)
    end

    def forms(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FormCollection.new(obj, *args)
    end

    def frame(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Frame.new(obj, *args)
    end

    def frames(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameCollection.new(obj, *args)
    end

    def frameset(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameSet.new(obj, *args)
    end

    def framesets(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::FrameSetCollection.new(obj, *args)
    end

    def g(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::G.new(obj, *args)
    end

    def gs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::GCollection.new(obj, *args)
    end

    def h1(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h1s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def h2(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h2s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def h3(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h3s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def h4(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h4s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def h5(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h5s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def h6(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Heading.new(obj, *args)
    end

    def h6s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadingCollection.new(obj, *args)
    end

    def hatchpath(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Hatchpath.new(obj, *args)
    end

    def hatchpaths(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HatchpathCollection.new(obj, *args)
    end

    def head(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Head.new(obj, *args)
    end

    def header(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def headers(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def heads(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HeadCollection.new(obj, *args)
    end

    def hidden(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Hidden.new(obj, *args)
    end

    def hiddens(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HiddenCollection.new(obj, *args)
    end

    def hr(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HR.new(obj, *args)
    end

    def hrs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HRCollection.new(obj, *args)
    end

    def htmls(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HtmlCollection.new(obj, *args)
    end

    def i(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def iframe(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::IFrame.new(obj, *args)
    end

    def iframes(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::IFrameCollection.new(obj, *args)
    end

    def image(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Image.new(obj, *args)
    end

    def images(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ImageCollection.new(obj, *args)
    end

    def img(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Image.new(obj, *args)
    end

    def imgs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ImageCollection.new(obj, *args)
    end

    def input(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Input.new(obj, *args)
    end

    def inputs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::InputCollection.new(obj, *args)
    end

    def ins(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mod.new(obj, *args)
    end

    def inses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ModCollection.new(obj, *args)
    end

    def is(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def kbd(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def kbds(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def keygen(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Keygen.new(obj, *args)
    end

    def keygens(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::KeygenCollection.new(obj, *args)
    end

    def label(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Label.new(obj, *args)
    end

    def labels(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LabelCollection.new(obj, *args)
    end

    def legend(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Legend.new(obj, *args)
    end

    def legends(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LegendCollection.new(obj, *args)
    end

    def li(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LI.new(obj, *args)
    end

    def line(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Line.new(obj, *args)
    end

    def linear_gradient(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LinearGradient.new(obj, *args)
    end

    def linear_gradients(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LinearGradientCollection.new(obj, *args)
    end

    def lines(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LineCollection.new(obj, *args)
    end

    def link(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Anchor.new(obj, *args)
    end

    def links(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::AnchorCollection.new(obj, *args)
    end

    def lis(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::LICollection.new(obj, *args)
    end

    def main(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def mains(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def map(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Map.new(obj, *args)
    end

    def maps(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MapCollection.new(obj, *args)
    end

    def mark(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def marker(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Marker.new(obj, *args)
    end

    def markers(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MarkerCollection.new(obj, *args)
    end

    def marks(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def menu(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Menu.new(obj, *args)
    end

    def menuitem(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuItem.new(obj, *args)
    end

    def menuitems(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuItemCollection.new(obj, *args)
    end

    def menus(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MenuCollection.new(obj, *args)
    end

    def mesh(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Mesh.new(obj, *args)
    end

    def meshes(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshCollection.new(obj, *args)
    end

    def meshgradient(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshGradient.new(obj, *args)
    end

    def meshgradients(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshGradientCollection.new(obj, *args)
    end

    def meshpatch(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meshpatch.new(obj, *args)
    end

    def meshpatches(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshpatchCollection.new(obj, *args)
    end

    def meshrow(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meshrow.new(obj, *args)
    end

    def meshrows(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeshrowCollection.new(obj, *args)
    end

    def meta(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meta.new(obj, *args)
    end

    def metadata(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Metadata.new(obj, *args)
    end

    def metadatas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MetadataCollection.new(obj, *args)
    end

    def metas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MetaCollection.new(obj, *args)
    end

    def meter(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Meter.new(obj, *args)
    end

    def meters(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::MeterCollection.new(obj, *args)
    end

    def nav(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def navs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def noscript(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def noscripts(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def object(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Object.new(obj, *args)
    end

    def objects(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ObjectCollection.new(obj, *args)
    end

    def ol(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OList.new(obj, *args)
    end

    def ols(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OListCollection.new(obj, *args)
    end

    def optgroup(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptGroup.new(obj, *args)
    end

    def optgroups(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptGroupCollection.new(obj, *args)
    end

    def option(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Option.new(obj, *args)
    end

    def options(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OptionCollection.new(obj, *args)
    end

    def output(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Output.new(obj, *args)
    end

    def outputs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::OutputCollection.new(obj, *args)
    end

    def p(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Paragraph.new(obj, *args)
    end

    def param(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Param.new(obj, *args)
    end

    def params(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ParamCollection.new(obj, *args)
    end

    def path(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Path.new(obj, *args)
    end

    def paths(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PathCollection.new(obj, *args)
    end

    def pattern(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Pattern.new(obj, *args)
    end

    def patterns(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PatternCollection.new(obj, *args)
    end

    def picture(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Picture.new(obj, *args)
    end

    def pictures(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PictureCollection.new(obj, *args)
    end

    def polygon(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Polygon.new(obj, *args)
    end

    def polygons(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PolygonCollection.new(obj, *args)
    end

    def polyline(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Polyline.new(obj, *args)
    end

    def polylines(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PolylineCollection.new(obj, *args)
    end

    def pre(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Pre.new(obj, *args)
    end

    def pres(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::PreCollection.new(obj, *args)
    end

    def progress(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Progress.new(obj, *args)
    end

    def progresses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ProgressCollection.new(obj, *args)
    end

    def ps(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ParagraphCollection.new(obj, *args)
    end

    def q(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Quote.new(obj, *args)
    end

    def qs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::QuoteCollection.new(obj, *args)
    end

    def radial_gradient(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadialGradient.new(obj, *args)
    end

    def radial_gradients(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadialGradientCollection.new(obj, *args)
    end

    def radio(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Radio.new(obj, *args)
    end

    def radios(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::RadioCollection.new(obj, *args)
    end

    def rb(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def rbs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def rect(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Rect.new(obj, *args)
    end

    def rects(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::RectCollection.new(obj, *args)
    end

    def rp(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def rps(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def rt(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def rtc(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def rtcs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def rts(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def rubies(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def ruby(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def s(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def samp(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def samps(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def script(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Script.new(obj, *args)
    end

    def scripts(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ScriptCollection.new(obj, *args)
    end

    def section(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def sections(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def select(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Select.new(obj, *args)
    end

    def select_list(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Select.new(obj, *args)
    end

    def select_lists(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SelectCollection.new(obj, *args)
    end

    def selects(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SelectCollection.new(obj, *args)
    end

    def small(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def smalls(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def solidcolor(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Solidcolor.new(obj, *args)
    end

    def solidcolors(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SolidcolorCollection.new(obj, *args)
    end

    def source(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Source.new(obj, *args)
    end

    def sources(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SourceCollection.new(obj, *args)
    end

    def span(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Span.new(obj, *args)
    end

    def spans(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SpanCollection.new(obj, *args)
    end

    def ss(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def stop(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Stop.new(obj, *args)
    end

    def stops(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::StopCollection.new(obj, *args)
    end

    def strong(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def strongs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def style(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Style.new(obj, *args)
    end

    def styles(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::StyleCollection.new(obj, *args)
    end

    def sub(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def subs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def summaries(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def summary(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def sup(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def sups(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def svg(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SVG.new(obj, *args)
    end

    def svgs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SVGCollection.new(obj, *args)
    end

    def switch(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Switch.new(obj, *args)
    end

    def switches(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SwitchCollection.new(obj, *args)
    end

    def symbol(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Symbol.new(obj, *args)
    end

    def symbols(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::SymbolCollection.new(obj, *args)
    end

    def table(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Table.new(obj, *args)
    end

    def tables(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableCollection.new(obj, *args)
    end

    def tbody(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(obj, *args)
    end

    def tbodys(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(obj, *args)
    end

    def td(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableDataCell.new(obj, *args)
    end

    def tds(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableDataCellCollection.new(obj, *args)
    end

    def template(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Template.new(obj, *args)
    end

    def templates(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TemplateCollection.new(obj, *args)
    end

    def text_field(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextField.new(obj, *args)
    end

    def text_fields(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextFieldCollection.new(obj, *args)
    end

    def text_path(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextPath.new(obj, *args)
    end

    def text_paths(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextPathCollection.new(obj, *args)
    end

    def textarea(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextArea.new(obj, *args)
    end

    def textareas(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TextAreaCollection.new(obj, *args)
    end

    def tfoot(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(obj, *args)
    end

    def tfoots(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(obj, *args)
    end

    def th(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableHeaderCell.new(obj, *args)
    end

    def thead(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSection.new(obj, *args)
    end

    def theads(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableSectionCollection.new(obj, *args)
    end

    def ths(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableHeaderCellCollection.new(obj, *args)
    end

    def time(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Time.new(obj, *args)
    end

    def times(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TimeCollection.new(obj, *args)
    end

    def titles(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TitleCollection.new(obj, *args)
    end

    def tr(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableRow.new(obj, *args)
    end

    def track(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Track.new(obj, *args)
    end

    def tracks(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TrackCollection.new(obj, *args)
    end

    def trs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TableRowCollection.new(obj, *args)
    end

    def tspan(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TSpan.new(obj, *args)
    end

    def tspans(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::TSpanCollection.new(obj, *args)
    end

    def u(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def ul(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::UList.new(obj, *args)
    end

    def uls(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::UListCollection.new(obj, *args)
    end

    def us(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def use(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Use.new(obj, *args)
    end

    def uses(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::UseCollection.new(obj, *args)
    end

    def var(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def vars(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def video(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Video.new(obj, *args)
    end

    def videos(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::VideoCollection.new(obj, *args)
    end

    def view(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::View.new(obj, *args)
    end

    def views(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::ViewCollection.new(obj, *args)
    end

    def wbr(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElement.new(obj, *args)
    end

    def wbrs(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::HTMLElementCollection.new(obj, *args)
    end

    def cell(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Cell.new(obj, *args)
    end

    def cells(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::CellCollection.new(obj, *args)
    end

    def row(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::Row.new(obj, *args)
    end

    def rows(*args)
      respond_to?(:target) ? obj = self : obj = @browser
      Insite::RowCollection.new(obj, *args)
    end

  end
end
