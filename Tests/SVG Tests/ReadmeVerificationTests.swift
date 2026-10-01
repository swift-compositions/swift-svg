import Space_Test_Support
import SVG
import Testing

@Suite
struct `README Verification` {

    @Test
    func `Overview example`() {
        let logo = svg(width: 200, height: 200) {
            defs {
                linearGradient(id: "gradient", x1: "0%", y1: "0%", x2: "100%", y2: "100%") {
                    stop(offset: "0%", stopColor: "#FF6B6B")
                    stop(offset: "100%", stopColor: "#4ECDC4")
                }
            }

            circle(cx: 100, cy: 100, r: 80)
                .fill("url(#gradient)")
                .stroke("#333")
                .strokeWidth(2)

            text(x: 100, y: 105) { "Swift" }
                .fontSize(24)
                .fontFamily("system-ui, sans-serif")
                .textAnchor("middle")
                .fill("white")
        }

        let svgString = String(logo)
        #expect(svgString.contains("<svg"))
        #expect(svgString.contains("width=\"200\""))
        #expect(svgString.contains("height=\"200\""))
        #expect(svgString.contains("linearGradient"))
        #expect(svgString.contains("gradient"))
        #expect(svgString.contains("circle"))
        #expect(svgString.contains("text"))
    }

    @Test
    func `Quick Start example`() {
        let icon = svg(viewBox: .init(minX: 0, minY: 0, width: 24, height: 24)) {
            path(d: "M12 2L2 7l10 5 10-5-10-5z")
                .fill("currentColor")
            path(d: "M2 17l10 5 10-5-10-5z")
                .fill("currentColor")
                .opacity(0.7)
        }

        let svgString = String(icon)
        #expect(svgString.contains("<svg"))
        #expect(svgString.contains("viewBox=\"0 0 24 24\""))
        #expect(svgString.contains("<path"))
        #expect(svgString.contains("M12 2L2 7l10 5 10-5-10-5z"))
        #expect(svgString.contains("M2 17l10 5 10-5-10-5z"))
        #expect(svgString.contains("fill=\"currentColor\""))
        #expect(svgString.contains("opacity=\"0.7\""))
    }

    @Test
    func `Basic shapes example`() {
        let basicShapes = svg(width: 200, height: 200) {
            circle(cx: 50, cy: 50, r: 40)
                .fill("red")
                .stroke("black")
                .strokeWidth(2)

            rect(x: 100, y: 10, width: 80, height: 60)
                .rx(5 as Double)
                .fill("blue")
                .opacity(0.5)
        }

        let output = String(basicShapes)
        #expect(output.contains("<svg"))
        #expect(output.contains("<circle"))
        #expect(output.contains("cx=\"50\""))
        #expect(output.contains("cy=\"50\""))
        #expect(output.contains("r=\"40\""))
        #expect(output.contains("fill=\"red\""))
        #expect(output.contains("stroke=\"black\""))
        #expect(output.contains("stroke-width=\"2\""))
        #expect(output.contains("<rect"))
        #expect(output.contains("x=\"100\""))
        #expect(output.contains("y=\"10\""))
        #expect(output.contains("width=\"80\""))
        #expect(output.contains("height=\"60\""))
        #expect(output.contains("rx=\"5\""))
        #expect(output.contains("fill=\"blue\""))
        #expect(output.contains("opacity=\"0.5\""))
    }

    @Test
    func `Gradients example`() {
        let gradientExample = svg(width: 200, height: 200) {
            defs {
                linearGradient(id: "myGradient", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
                    stop(offset: "0%", stopColor: "red")
                    stop(offset: "100%", stopColor: "blue")
                }
            }

            circle(cx: 100, cy: 100, r: 80)
                .fill("url(#myGradient)")
        }

        let output = String(gradientExample)
        #expect(output.contains("<svg"))
        #expect(output.contains("<defs"))
        #expect(output.contains("linearGradient"))
        #expect(output.contains("id=\"myGradient\""))
        #expect(output.contains("x1=\"0%\""))
        #expect(output.contains("y1=\"0%\""))
        #expect(output.contains("x2=\"100%\""))
        #expect(output.contains("y2=\"0%\""))
        #expect(output.contains("stop"))
        #expect(output.contains("offset=\"0%\""))
        #expect(output.contains("stop-color=\"red\""))
        #expect(output.contains("offset=\"100%\""))
        #expect(output.contains("stop-color=\"blue\""))
        #expect(output.contains("<circle"))
        #expect(output.contains("fill=\"url(#myGradient)\""))
    }

    @Test
    func `Text elements example`() {
        let textExample = svg(width: 200, height: 100) {
            text(x: 100, y: 50) { "Hello SVG" }
                .fontSize(24)
                .fontFamily("system-ui, sans-serif")
                .textAnchor("middle")
                .fill("black")
        }

        let output = String(textExample)
        #expect(output.contains("<svg"))
        #expect(output.contains("width=\"200\""))
        #expect(output.contains("height=\"100\""))
        #expect(output.contains("<text"))
        #expect(output.contains("x=\"100\""))
        #expect(output.contains("y=\"50\""))
        #expect(output.contains("font-size=\"24\""))
        #expect(output.contains("font-family=\"system-ui, sans-serif\""))
        #expect(output.contains("text-anchor=\"middle\""))
        #expect(output.contains("fill=\"black\""))
        #expect(output.contains("Hello SVG"))
    }

    @Test
    func `Testing example`() {
        let logo = svg(width: 100, height: 100) {
            circle(cx: 50, cy: 50, r: 45)
                .fill("blue")
        }

        let output = String(logo)
        #expect(output.contains("<svg"))
        #expect(output.contains("width=\"100\""))
        #expect(output.contains("height=\"100\""))
        #expect(output.contains("<circle"))
        #expect(output.contains("cx=\"50\""))
        #expect(output.contains("cy=\"50\""))
        #expect(output.contains("r=\"45\""))
        #expect(output.contains("fill=\"blue\""))
    }
}
