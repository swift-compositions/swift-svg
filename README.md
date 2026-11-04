# swift-svg

Use this package when you want to write SVG images in Swift and render them to text. Start from the lowercase element names, such as `svg` for `SVG_Standard.Document.SVG` and `circle` for `SVG_Standard.Shapes.Circle`, and render by passing the element to `String`. If you only need the SVG types without rendering, use swift-svg-standard. If you only need the renderer, use swift-svg-render. To put SVG inside an HTML page, use the InlineSVG view from swift-html.

## Laws

- Rendering to a `String` gives a single line by default. The `pretty` configuration puts each element on its own line, indented by two spaces.
- Attributes are written in the reverse of the order they were given: the last modifier applied comes first, and the element's own arguments come last, also reversed.
- The root `svg` element is written without an xmlns attribute, so a standalone SVG file needs the namespace added.
