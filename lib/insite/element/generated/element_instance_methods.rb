module Insite
  module ElementInstanceMethods
    def a(*args)
      Insite::Anchor.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def abbr(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def abbrs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def address(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def addresses(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def area(*args)
      Insite::Area.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def areas(*args)
      Insite::AreaCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def article(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def articles(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def as(*args)
      Insite::AnchorCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def aside(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def asides(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def audio(*args)
      Insite::Audio.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def audios(*args)
      Insite::AudioCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def b(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def base(*args)
      Insite::Base.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bases(*args)
      Insite::BaseCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bdi(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bdis(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bdo(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bdos(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def blockquote(*args)
      Insite::Quote.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def blockquotes(*args)
      Insite::QuoteCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def body(*args)
      Insite::Body.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bodys(*args)
      Insite::BodyCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def br(*args)
      Insite::BR.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def brs(*args)
      Insite::BRCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def bs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def button(*args)
      Insite::Button.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def buttons(*args)
      Insite::ButtonCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def canvas(*args)
      Insite::Canvas.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def canvases(*args)
      Insite::CanvasCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def caption(*args)
      Insite::TableCaption.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def captions(*args)
      Insite::TableCaptionCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def checkbox(*args)
      Insite::CheckBox.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def checkboxes(*args)
      Insite::CheckBoxCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def circle(*args)
      Insite::Circle.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def circles(*args)
      Insite::CircleCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cite(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cites(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def code(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def codes(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def col(*args)
      Insite::TableCol.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def colgroup(*args)
      Insite::TableCol.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def colgroups(*args)
      Insite::TableColCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cols(*args)
      Insite::TableColCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cursor(*args)
      Insite::Cursor.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cursors(*args)
      Insite::CursorCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def data(*args)
      Insite::Data.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def datalist(*args)
      Insite::DataList.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def datalists(*args)
      Insite::DataListCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def datas(*args)
      Insite::DataCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def date_field(*args)
      Insite::DateField.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def date_fields(*args)
      Insite::DateFieldCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def date_time_field(*args)
      Insite::DateTimeField.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def date_time_fields(*args)
      Insite::DateTimeFieldCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dd(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dds(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def defs(*args)
      Insite::Defs.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def defss(*args)
      Insite::DefsCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def del(*args)
      Insite::Mod.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dels(*args)
      Insite::ModCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def desc(*args)
      Insite::Desc.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def descs(*args)
      Insite::DescCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def details(*args)
      Insite::Details.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def detailses(*args)
      Insite::DetailsCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dfn(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dfns(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def div(*args)
      Insite::Div.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def divs(*args)
      Insite::DivCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dl(*args)
      Insite::DList.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dls(*args)
      Insite::DListCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dt(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def dts(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def element(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def elements(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ellipse(*args)
      Insite::Ellipse.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ellipses(*args)
      Insite::EllipseCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def em(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def embed(*args)
      Insite::Embed.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def embeds(*args)
      Insite::EmbedCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ems(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def field_set(*args)
      Insite::FieldSet.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def field_sets(*args)
      Insite::FieldSetCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def fieldset(*args)
      Insite::FieldSet.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def fieldsets(*args)
      Insite::FieldSetCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def figcaption(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def figcaptions(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def figure(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def figures(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def file_field(*args)
      Insite::FileField.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def file_fields(*args)
      Insite::FileFieldCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def font(*args)
      Insite::Font.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def fonts(*args)
      Insite::FontCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def footer(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def footers(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def foreign_object(*args)
      Insite::ForeignObject.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def foreign_objects(*args)
      Insite::ForeignObjectCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def form(*args)
      Insite::Form.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def forms(*args)
      Insite::FormCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def frame(*args)
      Insite::Frame.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def frames(*args)
      Insite::FrameCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def frameset(*args)
      Insite::FrameSet.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def framesets(*args)
      Insite::FrameSetCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def g(*args)
      Insite::G.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def gs(*args)
      Insite::GCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h1(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h1s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h2(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h2s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h3(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h3s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h4(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h4s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h5(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h5s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h6(*args)
      Insite::Heading.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def h6s(*args)
      Insite::HeadingCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hatchpath(*args)
      Insite::Hatchpath.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hatchpaths(*args)
      Insite::HatchpathCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def head(*args)
      Insite::Head.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def header(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def headers(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def heads(*args)
      Insite::HeadCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hidden(*args)
      Insite::Hidden.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hiddens(*args)
      Insite::HiddenCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hr(*args)
      Insite::HR.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def hrs(*args)
      Insite::HRCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def htmls(*args)
      Insite::HtmlCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def i(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def iframe(*args)
      Insite::IFrame.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def iframes(*args)
      Insite::IFrameCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def image(*args)
      Insite::Image.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def images(*args)
      Insite::ImageCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def img(*args)
      Insite::Image.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def imgs(*args)
      Insite::ImageCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def input(*args)
      Insite::Input.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def inputs(*args)
      Insite::InputCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ins(*args)
      Insite::Mod.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def inses(*args)
      Insite::ModCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def is(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def kbd(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def kbds(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def keygen(*args)
      Insite::Keygen.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def keygens(*args)
      Insite::KeygenCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def label(*args)
      Insite::Label.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def labels(*args)
      Insite::LabelCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def legend(*args)
      Insite::Legend.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def legends(*args)
      Insite::LegendCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def li(*args)
      Insite::LI.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def line(*args)
      Insite::Line.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def linear_gradient(*args)
      Insite::LinearGradient.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def linear_gradients(*args)
      Insite::LinearGradientCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def lines(*args)
      Insite::LineCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def link(*args)
      Insite::Anchor.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def links(*args)
      Insite::AnchorCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def lis(*args)
      Insite::LICollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def main(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def mains(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def map(*args)
      Insite::Map.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def maps(*args)
      Insite::MapCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def mark(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def marker(*args)
      Insite::Marker.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def markers(*args)
      Insite::MarkerCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def marks(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def menu(*args)
      Insite::Menu.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def menuitem(*args)
      Insite::MenuItem.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def menuitems(*args)
      Insite::MenuItemCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def menus(*args)
      Insite::MenuCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def mesh(*args)
      Insite::Mesh.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshes(*args)
      Insite::MeshCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshgradient(*args)
      Insite::MeshGradient.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshgradients(*args)
      Insite::MeshGradientCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshpatch(*args)
      Insite::Meshpatch.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshpatches(*args)
      Insite::MeshpatchCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshrow(*args)
      Insite::Meshrow.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meshrows(*args)
      Insite::MeshrowCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meta(*args)
      Insite::Meta.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def metadata(*args)
      Insite::Metadata.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def metadatas(*args)
      Insite::MetadataCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def metas(*args)
      Insite::MetaCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meter(*args)
      Insite::Meter.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def meters(*args)
      Insite::MeterCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def nav(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def navs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def noscript(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def noscripts(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def object(*args)
      Insite::Object.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def objects(*args)
      Insite::ObjectCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ol(*args)
      Insite::OList.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ols(*args)
      Insite::OListCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def optgroup(*args)
      Insite::OptGroup.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def optgroups(*args)
      Insite::OptGroupCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def option(*args)
      Insite::Option.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def options(*args)
      Insite::OptionCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def output(*args)
      Insite::Output.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def outputs(*args)
      Insite::OutputCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def p(*args)
      Insite::Paragraph.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def param(*args)
      Insite::Param.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def params(*args)
      Insite::ParamCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def path(*args)
      Insite::Path.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def paths(*args)
      Insite::PathCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def pattern(*args)
      Insite::Pattern.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def patterns(*args)
      Insite::PatternCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def picture(*args)
      Insite::Picture.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def pictures(*args)
      Insite::PictureCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def polygon(*args)
      Insite::Polygon.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def polygons(*args)
      Insite::PolygonCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def polyline(*args)
      Insite::Polyline.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def polylines(*args)
      Insite::PolylineCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def pre(*args)
      Insite::Pre.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def pres(*args)
      Insite::PreCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def progress(*args)
      Insite::Progress.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def progresses(*args)
      Insite::ProgressCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ps(*args)
      Insite::ParagraphCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def q(*args)
      Insite::Quote.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def qs(*args)
      Insite::QuoteCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def radial_gradient(*args)
      Insite::RadialGradient.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def radial_gradients(*args)
      Insite::RadialGradientCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def radio(*args)
      Insite::Radio.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def radios(*args)
      Insite::RadioCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rb(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rbs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rect(*args)
      Insite::Rect.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rects(*args)
      Insite::RectCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rp(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rps(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rt(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rtc(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rtcs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rts(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rubies(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ruby(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def s(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def samp(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def samps(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def script(*args)
      Insite::Script.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def scripts(*args)
      Insite::ScriptCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def section(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def sections(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def select(*args)
      Insite::Select.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def select_list(*args)
      Insite::Select.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def select_lists(*args)
      Insite::SelectCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def selects(*args)
      Insite::SelectCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def small(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def smalls(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def solidcolor(*args)
      Insite::Solidcolor.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def solidcolors(*args)
      Insite::SolidcolorCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def source(*args)
      Insite::Source.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def sources(*args)
      Insite::SourceCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def span(*args)
      Insite::Span.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def spans(*args)
      Insite::SpanCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ss(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def stop(*args)
      Insite::Stop.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def stops(*args)
      Insite::StopCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def strong(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def strongs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def style(*args)
      Insite::Style.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def styles(*args)
      Insite::StyleCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def sub(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def subs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def summaries(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def summary(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def sup(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def sups(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def svg(*args)
      Insite::SVG.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def svgs(*args)
      Insite::SVGCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def switch(*args)
      Insite::Switch.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def switches(*args)
      Insite::SwitchCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def symbol(*args)
      Insite::Symbol.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def symbols(*args)
      Insite::SymbolCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def table(*args)
      Insite::Table.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tables(*args)
      Insite::TableCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tbody(*args)
      Insite::TableSection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tbodys(*args)
      Insite::TableSectionCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def td(*args)
      Insite::TableDataCell.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tds(*args)
      Insite::TableDataCellCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def template(*args)
      Insite::Template.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def templates(*args)
      Insite::TemplateCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def text_field(*args)
      Insite::TextField.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def text_fields(*args)
      Insite::TextFieldCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def text_path(*args)
      Insite::TextPath.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def text_paths(*args)
      Insite::TextPathCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def textarea(*args)
      Insite::TextArea.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def textareas(*args)
      Insite::TextAreaCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tfoot(*args)
      Insite::TableSection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tfoots(*args)
      Insite::TableSectionCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def th(*args)
      Insite::TableHeaderCell.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def thead(*args)
      Insite::TableSection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def theads(*args)
      Insite::TableSectionCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ths(*args)
      Insite::TableHeaderCellCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def time(*args)
      Insite::Time.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def times(*args)
      Insite::TimeCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def titles(*args)
      Insite::TitleCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tr(*args)
      Insite::TableRow.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def track(*args)
      Insite::Track.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tracks(*args)
      Insite::TrackCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def trs(*args)
      Insite::TableRowCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tspan(*args)
      Insite::TSpan.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def tspans(*args)
      Insite::TSpanCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def u(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def ul(*args)
      Insite::UList.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def uls(*args)
      Insite::UListCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def us(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def use(*args)
      Insite::Use.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def uses(*args)
      Insite::UseCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def var(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def vars(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def video(*args)
      Insite::Video.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def videos(*args)
      Insite::VideoCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def view(*args)
      Insite::View.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def views(*args)
      Insite::ViewCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def wbr(*args)
      Insite::HTMLElement.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def wbrs(*args)
      Insite::HTMLElementCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cell(*args)
      Insite::Cell.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def cells(*args)
      Insite::CellCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def row(*args)
      Insite::Row.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

    def rows(*args)
      Insite::RowCollection.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

  end
end