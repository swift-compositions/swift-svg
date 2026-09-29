import Spatial_Test_Support
import SVG
import Testing

@Suite
struct `Document Tests` {

    @Test
    func `SVG element renders with dimensions`() {
        let svgElement = svg(width: 100, height: 100) {
            circle(cx: 50, cy: 50, r: 40)
        }

        let rendered = String(svgElement)
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("width=\"100\""))
        #expect(rendered.contains("height=\"100\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("</svg>"))
    }

    @Test
    func `SVG with nested elements renders correctly`() {
        let svgElement = svg(width: 100, height: 100) {
            rect(x: 10, y: 10, width: 80, height: 80)
        }

        let rendered = String(svgElement)
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("<rect"))
        #expect(rendered.contains("</svg>"))
    }

    @Test
    func `Pretty printing works correctly`() {
        let svgElement = svg {
            g {
                circle(cx: 50, cy: 50, r: 40)
                rect(x: 10, y: 10, width: 30, height: 30)
            }
        }

        let rendered = String(svgElement, configuration: .pretty)
        #expect(rendered.contains("\n"))
        #expect(rendered.contains("  "))
    }

    @Test
    func `Compact rendering works correctly`() {
        let svgElement = svg {
            circle(cx: 50, cy: 50, r: 40)
        }

        let rendered = String(svgElement)
        #expect(!rendered.contains("\n"))
    }
}
