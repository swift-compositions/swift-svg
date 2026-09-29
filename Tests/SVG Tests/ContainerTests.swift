import Spatial_Test_Support
import SVG
import Testing

@Suite
struct `Container Elements Tests` {

    @Test
    func `SVG root element renders correctly`() {
        let svgElement = svg(width: 200, height: 100) {
            circle(cx: 50, cy: 50, r: 40)
                .fill("red")
        }

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<svg"#))
        #expect(rendered.contains(#"width="200""#))
        #expect(rendered.contains(#"height="100""#))
        #expect(rendered.contains(#"<circle"#))
        #expect(rendered.contains(#"</svg>"#))
    }

    @Test
    func `Group element renders correctly`() {
        let svgElement = g()
            .translate(x: 50, y: 50)

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<g"#))
        #expect(rendered.contains(#"transform="translate(50"#))
        #expect(rendered.contains(#"</g>"#))
    }

    @Test
    func `Group with nested content renders correctly`() {
        let svgElement = g {
            circle(cx: 0, cy: 0, r: 25)
                .fill("blue")
            rect(x: -10, y: -10, width: 20, height: 20)
                .fill("white")
        }

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<g"#))
        #expect(rendered.contains(#"<circle"#))
        #expect(rendered.contains(#"<rect"#))
        #expect(rendered.contains(#"</g>"#))
    }

    @Test
    func `Nested groups render correctly`() {
        let svgElement = svg(width: 300, height: 200) {
            g()
                .transform("scale(2)")
        }

        let rendered = String(svgElement)
        #expect(rendered.contains(#"transform="scale(2)""#))
    }

    @Test
    func `Defs element renders correctly`() {
        let svgElement = svg {
            defs {
                linearGradient(id: "myGradient", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
                    stop(offset: "0%", stopColor: "rgb(255,255,0)")
                    stop(offset: "100%", stopColor: "rgb(255,0,0)")
                }
            }
            circle(cx: 50, cy: 50, r: 40)
                .fill("url(#myGradient)")
        }

        let rendered = String(svgElement)
        #expect(rendered.contains(#"<defs>"#))
        #expect(rendered.contains(#"<linearGradient"#))
        #expect(rendered.contains(#"id="myGradient""#))
        #expect(rendered.contains(#"<stop"#))
        #expect(rendered.contains(#"</defs>"#))
        #expect(rendered.contains(#"fill="url(#myGradient)""#))
    }

    @Test
    func `Symbol and use elements render correctly`() {
        let svgElement = svg {
            defs {
                symbol(
                    id: "mySymbol",
                    viewBox: SVG_Standard.Types.ViewBox(minX: 0, minY: 0, width: 100, height: 100)
                ) {
                    circle(cx: 50, cy: 50, r: 40)
                        .fill("green")
                }
            }
            use(href: "#mySymbol", x: 10, y: 10, width: 100, height: 100)
        }

        let rendered = String(svgElement)
        #expect(rendered.contains("<symbol"))
        #expect(rendered.contains("id=\"mySymbol\""))
        #expect(rendered.contains("viewBox=\"0 0 100 100\""))
        #expect(rendered.contains("<use"))
        #expect(rendered.contains("href=\"#mySymbol\""))
        #expect(rendered.contains("x=\"10\""))
        #expect(rendered.contains("y=\"10\""))
    }
}
