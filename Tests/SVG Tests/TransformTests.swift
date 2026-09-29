import Spatial_Test_Support
import SVG
import Testing

@Suite
struct `Transform Tests` {

    @Test
    func `Transform renders correctly using method`() {
        let svgElement = rect(x: 10, y: 10, width: 50, height: 50)
            .transform("rotate(45)")
            .fill("red")

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"rotate(45)\""))
    }

    @Test
    func `Translate helper renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .translate(x: 50, y: 50)
            .fill("blue")

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"translate(50"))
    }

    @Test
    func `Rotate helper renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .rotate(45)
            .fill("green")

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"rotate(45)\""))
    }

    @Test
    func `Rotate with center renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .rotate(45, cx: 50, cy: 50)

        let rendered = String(svgElement)
        #expect(rendered.contains("rotate(45"))
        #expect(rendered.contains("50"))
    }

    @Test
    func `Scale helper renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .scale(x: 2)
            .fill("purple")

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"scale(2)\""))
    }

    @Test
    func `SkewX helper renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .skewX(30)

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"skewX(30)\""))
    }

    @Test
    func `SkewY helper renders correctly`() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .skewY(30)

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"skewY(30)\""))
    }

    @Test
    func `Transform on group renders correctly`() {
        let svgElement = g {
            circle(cx: 0, cy: 0, r: 25)
            rect(x: -10, y: -10, width: 20, height: 20)
        }
        .transform("scale(1.5)")

        let rendered = String(svgElement)
        #expect(rendered.contains("transform=\"scale(1.5)\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("<rect"))
    }
}
