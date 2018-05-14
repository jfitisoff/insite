module Insite
  ELEMENT_MAP = {
    "Insite::VideoCollection"=>[:videos],
    "Insite::Rect"=>[:rect],
    "Insite::Menu"=>[:menu],
    "Insite::HTMLElement"=>[
      :var,
      :i,
      :abbr,
      :summary,
      :cite,
      :code,
      :rb,
      :address,
      :article,
      :aside,
      :bdi,
      :bdo,
      :dfn,
      :dt,
      :em,
      :figcaption,
      :footer,
      :figure,
      :header,
      :kbd,
      :mark,
      :main,
      :noscript,
      :nav,
      :dd,
      :rtc,
      :rt,
      :rp,
      :section,
      :samp,
      :strong,
      :s,
      :small,
      :sup,
      :sub,
      :element,
      :b,
      :ruby,
      :u,
      :wbr
    ],
    "Insite::Anchor"=>[
      :a,
      :link
    ],
    "Insite::HTMLElementCollection"=>[
      :headers,
      :is,
      :vars,
      :elements,
      :abbrs,
      :addresses,
      :articles,
      :asides,
      :bs,
      :bdis,
      :bdos,
      :cites,
      :codes,
      :dds,
      :dfns,
      :dts,
      :ems,
      :figcaptions,
      :figures,
      :footers,
      :mains,
      :kbds,
      :navs,
      :marks,
      :noscripts,
      :rbs,
      :rps,
      :rts,
      :rubies,
      :ss,
      :rtcs,
      :samps,
      :sections,
      :sups,
      :strongs,
      :subs,
      :smalls,
      :summaries,
      :wbrs,
      :us
    ],
    "Insite::TimeCollection"=>[:times],
    "Insite::Circle"=>[:circle],
    "Insite::CircleCollection"=>[:circles],
    "Insite::Cursor"=>[:cursor],
    "Insite::CursorCollection"=>[:cursors],
    "Insite::Defs"=>[:defs],
    "Insite::DefsCollection"=>[:defss],
    "Insite::Desc"=>[:desc],
    "Insite::DescCollection"=>[:descs],
    "Insite::Ellipse"=>[:ellipse],
    "Insite::EllipseCollection"=>[:ellipses],
    "Insite::ForeignObject"=>[:foreign_object],
    "Insite::ForeignObjectCollection"=>[:foreign_objects],
    "Insite::GCollection"=>[:gs],
    "Insite::Hatchpath"=>[:hatchpath],
    "Insite::HatchpathCollection"=>[:hatchpaths],
    "Insite::Button"=>[:button],
    "Insite::LinearGradient"=>[:linear_gradient],
    "Insite::LinearGradientCollection"=>[:linear_gradients],
    "Insite::Marker"=>[:marker],
    "Insite::MarkerCollection"=>[:markers],
    "Insite::Mesh"=>[:mesh],
    "Insite::MeshCollection"=>[:meshes],
    "Insite::MeshGradient"=>[:meshgradient],
    "Insite::MeshGradientCollection"=>[:meshgradients],
    "Insite::Meshpatch"=>[:meshpatch],
    "Insite::MeshpatchCollection"=>[:meshpatches],
    "Insite::Meshrow"=>[:meshrow],
    "Insite::MeshrowCollection"=>[:meshrows],
    "Insite::MetadataCollection"=>[:metadatas],
    "Insite::PatternCollection"=>[:patterns],
    "Insite::Polygon"=>[:polygon],
    "Insite::PolygonCollection"=>[:polygons],
    "Insite::Polyline"=>[:polyline],
    "Insite::Pre"=>[:pre],
    "Insite::PolylineCollection"=>[:polylines],
    "Insite::AreaCollection"=>[:areas],
    "Insite::RadialGradient"=>[:radial_gradient],
    "Insite::Script"=>[:script],
    "Insite::RectCollection"=>[:rects],
    "Insite::RadialGradientCollection"=>[:radial_gradients],
    "Insite::SolidcolorCollection"=>[:solidcolors],
    "Insite::StopCollection"=>[:stops],
    "Insite::Solidcolor"=>[:solidcolor],
    "Insite::SVGCollection"=>[:svgs],
    "Insite::TextPath"=>[:text_path],
    "Insite::Metadata"=>[:metadata],
    "Insite::SwitchCollection"=>[:switches],
    "Insite::Body"=>[:body],
    "Insite::LI"=>[:li],
    "Insite::SVG"=>[:svg],
    "Insite::TSpan"=>[:tspan],
    "Insite::TSpanCollection"=>[:tspans],
    "Insite::TextPathCollection"=>[:text_paths],
    "Insite::View"=>[:view],
    "Insite::ViewCollection"=>[:views],
    "Insite::CheckBoxCollection"=>[:checkboxes],
    "Insite::UseCollection"=>[:uses],
    "Insite::CheckBox"=>[:checkbox],
    "Insite::DateFieldCollection"=>[:date_fields],
    "Insite::DateField"=>[:date_field],
    "Insite::Style"=>[:style],
    "Insite::DateTimeField"=>[:date_time_field],
    "Insite::DateTimeFieldCollection"=>[:date_time_fields],
    "Insite::FileField"=>[:file_field],
    "Insite::FileFieldCollection"=>[:file_fields],
    "Insite::Font"=>[:font],
    "Insite::FontCollection"=>[:fonts],
    "Insite::ImageCollection"=>[
      :imgs,
      :images
    ],
    "Insite::FrameCollection"=>[:frames],
    "Insite::HiddenCollection"=>[:hiddens],
    "Insite::Image"=>[
      :img,
      :image
    ],
    "Insite::AnchorCollection"=>[
      :as,
      :links
    ],
    "Insite::Radio"=>[:radio],
    "Insite::RadioCollection"=>[:radios],
    "Insite::Track"=>[:track],
    "Insite::Select"=>[
      :select,
      :select_list
    ],
    "Insite::SelectCollection"=>[
      :selects,
      :select_lists
    ],
    "Insite::Pattern"=>[:pattern],
    "Insite::TextField"=>[:text_field],
    "Insite::TextFieldCollection"=>[:text_fields],
    "Insite::Use"=>[:use],
    "Insite::TableCaption"=>[:caption],
    "Insite::FieldSet"=>[
      :fieldset,
      :field_set
    ],
    "Insite::RadioSet"=>[:radio_set],
    "Insite::FieldSetCollection"=>[
      :fieldsets,
      :field_sets
    ],
    "Insite::Input"=>[:input],
    "Insite::Output"=>[:output],
    "Insite::Area"=>[:area],
    "Insite::Audio"=>[:audio],
    "Insite::AudioCollection"=>[:audios],
    "Insite::BaseCollection"=>[:bases],
    "Insite::Quote"=>[
      :blockquote,
      :q
    ],
    "Insite::QuoteCollection"=>[
      :blockquotes,
      :qs
    ],
    "Insite::BodyCollection"=>[:bodys],
    "Insite::BR"=>[:br],
    "Insite::BRCollection"=>[:brs],
    "Insite::ButtonCollection"=>[:buttons],
    "Insite::Canvas"=>[:canvas],
    "Insite::CanvasCollection"=>[:canvases],
    "Insite::TableCaptionCollection"=>[:captions],
    "Insite::TableCol"=>[
      :colgroup,
      :col
    ],
    "Insite::TableColCollection"=>[
      :colgroups,
      :cols
    ],
    "Insite::DataCollection"=>[:datas],
    "Insite::DataList"=>[:datalist],
    "Insite::DataListCollection"=>[:datalists],
    "Insite::Mod"=>[
      :del,
      :ins
    ],
    "Insite::ModCollection"=>[
      :dels,
      :inses
    ],
    "Insite::DetailsCollection"=>[:detailses],
    "Insite::DivCollection"=>[:divs],
    "Insite::DList"=>[:dl],
    "Insite::DListCollection"=>[:dls],
    "Insite::Embed"=>[:embed],
    "Insite::EmbedCollection"=>[:embeds],
    "Insite::FormCollection"=>[:forms],
    "Insite::FrameSet"=>[:frameset],
    "Insite::FrameSetCollection"=>[:framesets],
    "Insite::Heading"=>[
      :h1,
      :h2,
      :h3,
      :h4,
      :h5,
      :h6
    ],
    "Insite::HeadingCollection"=>[
      :h1s,
      :h2s,
      :h3s,
      :h4s,
      :h5s,
      :h6s
    ],
    "Insite::Form"=>[:form],
    "Insite::Head"=>[:head],
    "Insite::HeadCollection"=>[:heads],
    "Insite::HR"=>[:hr],
    "Insite::HtmlCollection"=>[:htmls],
    "Insite::IFrame"=>[:iframe],
    "Insite::HRCollection"=>[:hrs],
    "Insite::Keygen"=>[:keygen],
    "Insite::InputCollection"=>[:inputs],
    "Insite::Label"=>[:label],
    "Insite::KeygenCollection"=>[:keygens],
    "Insite::MapCollection"=>[:maps],
    "Insite::LICollection"=>[:lis],
    "Insite::IFrameCollection"=>[:iframes],
    "Insite::MenuItem"=>[:menuitem],
    "Insite::Legend"=>[:legend],
    "Insite::Div"=>[:div],
    "Insite::Meter"=>[:meter],
    "Insite::MetaCollection"=>[:metas],
    "Insite::LegendCollection"=>[:legends],
    "Insite::OList"=>[:ol],
    "Insite::MenuItemCollection"=>[:menuitems],
    "Insite::Map"=>[:map],
    "Insite::MenuCollection"=>[:menus],
    "Insite::Data"=>[:data],
    "Insite::Picture"=>[:picture],
    "Insite::MeterCollection"=>[:meters],
    "Insite::Progress"=>[:progress],
    "Insite::OptGroupCollection"=>[:optgroups],
    "Insite::ParamCollection"=>[:params],
    "Insite::Param"=>[:param],
    "Insite::Object"=>[:object],
    "Insite::ParagraphCollection"=>[:ps],
    "Insite::OutputCollection"=>[:outputs],
    "Insite::ProgressCollection"=>[:progresses],
    "Insite::OListCollection"=>[:ols],
    "Insite::OptGroup"=>[:optgroup],
    "Insite::ScriptCollection"=>[:scripts],
    "Insite::ObjectCollection"=>[:objects],
    "Insite::PictureCollection"=>[:pictures],
    "Insite::OptionCollection"=>[:options],
    "Insite::SpanCollection"=>[:spans],
    "Insite::PreCollection"=>[:pres],
    "Insite::Span"=>[:span],
    "Insite::Source"=>[:source],
    "Insite::StyleCollection"=>[:styles],
    "Insite::TemplateCollection"=>[:templates],
    "Insite::Paragraph"=>[:p],
    "Insite::TableSectionCollection"=>[
      :tbodys,
      :theads,
      :tfoots
    ],
    "Insite::TextArea"=>[:textarea],
    "Insite::TableCollection"=>[:tables],
    "Insite::TableSection"=>[
      :tbody,
      :tfoot,
      :thead
    ],
    "Insite::Template"=>[:template],
    "Insite::TableDataCell"=>[:td],
    "Insite::Meta"=>[:meta],
    "Insite::TextAreaCollection"=>[:textareas],
    "Insite::TableHeaderCell"=>[:th],
    "Insite::TableDataCellCollection"=>[:tds],
    "Insite::Video"=>[:video],
    "Insite::TitleCollection"=>[:titles],
    "Insite::TableRowCollection"=>[:trs],
    "Insite::TrackCollection"=>[:tracks],
    "Insite::UList"=>[:ul],
    "Insite::TableHeaderCellCollection"=>[:ths],
    "Insite::Base"=>[:base],
    "Insite::Table"=>[:table],
    "Insite::PathCollection"=>[:paths],
    "Insite::UListCollection"=>[:uls],
    "Insite::Symbol"=>[:symbol],
    "Insite::SourceCollection"=>[:sources],
    "Insite::Line"=>[:line],
    "Insite::Option"=>[:option],
    "Insite::Path"=>[:path],
    "Insite::LineCollection"=>[:lines],
    "Insite::Frame"=>[:frame],
    "Insite::Stop"=>[:stop],
    "Insite::Time"=>[:time],
    "Insite::LabelCollection"=>[:labels],
    "Insite::SymbolCollection"=>[:symbols],
    "Insite::TableRow"=>[:tr],
    "Insite::Hidden"=>[:hidden],
    "Insite::Details"=>[:details],
    "Insite::Switch"=>[:switch],
    "Insite::G"=>[:g]}.freeze

end
