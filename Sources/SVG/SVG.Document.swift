public import SVG_Rendering
public import SVG_Standard

extension SVG_Rendering::SVG {
    /// A standalone SVG document: its outermost `svg` element declares the SVG namespace,
    /// `xmlns="http://www.w3.org/2000/svg"`, so the rendered text opens as an `.svg` file.
    ///
    /// ```swift
    /// let document = SVG.Document(svg(width: 100, height: 100)) {
    ///     circle(cx: 50, cy: 50, r: 40)
    /// }
    /// ```
    public struct Document<Content: SVG_Rendering::SVG.View>: SVG_Rendering::SVG.View {
        /// The outermost `svg` element.
        public let root: SVG_Standard::SVG_Standard.Document.SVG

        let content: Content

        /// Creates a document whose outermost element is `root`, holding `content`.
        public init(
            _ root: SVG_Standard::SVG_Standard.Document.SVG,
            @SVG_Rendering::SVG.Builder _ content: () -> Content = { SVG_Rendering::SVG.Empty() }
        ) {
            self.root = root
            self.content = content()
        }
    }
}

extension SVG_Rendering::SVG.Document {
    /// The SVG namespace every standalone SVG document declares on its outermost element.
    public static var namespace: String { "http://www.w3.org/2000/svg" }

    public var body: some SVG_Rendering::SVG.View {
        root { content }
            .xmlns(Self.namespace)
    }
}
