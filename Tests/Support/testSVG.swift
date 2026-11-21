public import SVG
import SVG_Standard

public func testSVG<C: SVG.View>(
    width: W3C.SVG.`2`.Types.Length? = nil,
    height: W3C.SVG.`2`.Types.Length? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> C
) -> some SVG.View {
    SVG_Standard.Document.SVG(
        width: width,
        height: height,
        viewBox: viewBox
    )(content)
}
