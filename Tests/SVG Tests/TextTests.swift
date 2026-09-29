import Spatial_Test_Support
import SVG
import Testing

@Suite
struct `Text Elements Tests` {

    @Test
    func `Text element renders correctly`() {
        let svgElement = text(x: 10, y: 30) { "Hello, World!" }
            .fontFamily("Arial")
            .fontSize(20)
            .fill("black")

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<text"#))
        #expect(rendered.contains(#"x="10""#))
        #expect(rendered.contains(#"y="30""#))
        #expect(rendered.contains(#"font-family="Arial""#))
        #expect(rendered.contains(#"font-size="20""#))
        #expect(rendered.contains(#"fill="black""#))
        #expect(rendered.contains(#">Hello, World!</text>"#))
    }

    @Test
    func `Text with tspan renders correctly`() {
        let svgElement = text(x: 10, y: 30) {
            tspan { "First line" }
            tspan(x: 10, dy: 20) { "Second line" }
        }
        .fontSize(14)

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<text"#))
        #expect(rendered.contains(#"font-size="14""#))
        #expect(rendered.contains(#"<tspan"#))
        #expect(rendered.contains(#">First line</tspan>"#))
        #expect(rendered.contains(#"dy="20""#))
        #expect(rendered.contains(#">Second line</tspan>"#))
        #expect(rendered.contains(#"</text>"#))
    }

    @Test
    func `Text with rotate attribute renders correctly`() {
        let svgElement = text(x: 100, y: 100) { "Rotated" }
            .attribute("rotate", "0 15 30 45 60")
            .fill("purple")

        let rendered = String(svgElement)
        #expect(rendered.contains(#"rotate="0 15 30 45 60""#))
        #expect(rendered.contains(#">Rotated</text>"#))
    }

    @Test
    func `Text anchor renders correctly`() {
        let svgElement = text(x: 150, y: 50) { "Centered" }
            .textAnchor("middle")
            .fill("blue")

        let rendered = String(svgElement)
        #expect(rendered.contains(#"text-anchor="middle""#))
        #expect(rendered.contains(#">Centered</text>"#))
    }
}
