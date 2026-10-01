import Space_Test_Support
import SVG
import Testing

@Suite
struct `Debug` {

    @Test
    func `Simple circle renders`() {
        let svgElement = circle(cx: 50, cy: 50, r: 40)

        let rendered = String(svgElement)
        #expect(!rendered.isEmpty)
        #expect(rendered.contains("<circle"))
    }

    @Test
    func `Circle with attributes renders`() {
        let circleElement = circle(cx: 50, cy: 50, r: 40)
            .fill("red")
            .stroke("black")
            .strokeWidth(2)

        let rendered = String(circleElement)
        #expect(!rendered.isEmpty)
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("fill=\"red\""))
        #expect(rendered.contains("stroke=\"black\""))
    }

    @Test
    func `Check SVG rendering for consistency`() {
        let svgElement = svg(width: 100, height: 100) {
            circle(cx: 50, cy: 50, r: 40)
                .fill("red")
                .stroke("black")
                .strokeWidth(2)
        }

        let output = String(svgElement, configuration: .pretty)

        #expect(output.contains("<svg"))
        #expect(output.contains("width=\"100\""))
        #expect(output.contains("height=\"100\""))
        #expect(output.contains("<circle"))
        #expect(output.contains("fill=\"red\""))
        #expect(output.contains("stroke=\"black\""))
        #expect(output.contains("stroke-width=\"2\""))
        #expect(output.contains("</svg>"))
    }
}
