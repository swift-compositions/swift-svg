import Spatial_Test_Support
import SVG
import Testing

@Suite
struct `Basic Shapes Tests` {

    @Test
    func `Circle renders correctly`() {
        let svg = circle(cx: 50, cy: 50, r: 40)
            .fill("red")
            .stroke("black")
            .strokeWidth(3)

        let rendered = String(svg)
        #expect(rendered.contains(#"<circle"#))
        #expect(rendered.contains(#"cx="50""#))
        #expect(rendered.contains(#"cy="50""#))
        #expect(rendered.contains(#"r="40""#))
        #expect(rendered.contains(#"fill="red""#))
        #expect(rendered.contains(#"stroke="black""#))
        #expect(rendered.contains(#"stroke-width="3""#))
        #expect(rendered.contains(#"</circle>"#))
    }

    @Test
    func `Rectangle renders correctly`() {
        let svg = rect(x: 10, y: 20, width: 100, height: 50)
            .rx(5 as Double)
            .fill("blue")
            .opacity(0.5)

        let rendered = String(svg)
        #expect(rendered.contains(#"<rect"#))
        #expect(rendered.contains(#"x="10""#))
        #expect(rendered.contains(#"y="20""#))
        #expect(rendered.contains(#"width="100""#))
        #expect(rendered.contains(#"height="50""#))
        #expect(rendered.contains(#"rx="5""#))
        #expect(rendered.contains(#"fill="blue""#))
        #expect(rendered.contains(#"opacity="0.5""#))
        #expect(rendered.contains(#"</rect>"#))
    }

    @Test
    func `Ellipse renders correctly`() {
        let svg = ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
            .fill("green")

        let rendered = String(svg)
        #expect(rendered.contains(#"<ellipse"#))
        #expect(rendered.contains(#"cx="100""#))
        #expect(rendered.contains(#"cy="50""#))
        #expect(rendered.contains(#"rx="80""#))
        #expect(rendered.contains(#"ry="40""#))
        #expect(rendered.contains(#"fill="green""#))
        #expect(rendered.contains(#"</ellipse>"#))
    }

    @Test
    func `Line renders correctly`() {
        let svg = line(x1: 0, y1: 0, x2: 100, y2: 100)
            .stroke("red")
            .strokeWidth(2)

        let rendered = String(svg)
        #expect(rendered.contains(#"<line"#))
        #expect(rendered.contains(#"x1="0""#))
        #expect(rendered.contains(#"y1="0""#))
        #expect(rendered.contains(#"x2="100""#))
        #expect(rendered.contains(#"y2="100""#))
        #expect(rendered.contains(#"stroke="red""#))
        #expect(rendered.contains(#"stroke-width="2""#))
        #expect(rendered.contains(#"</line>"#))
    }

    @Test
    func `Polygon renders correctly`() {
        let svg = polygon(coordinates: [(100, 10), (40, 198), (190, 78), (10, 78), (160, 198)])
            .fill("lime")
            .stroke("purple")
            .strokeWidth(1)

        let rendered = String(svg)
        #expect(rendered.contains(#"<polygon"#))
        #expect(rendered.contains(#"points="100,10 40,198 190,78 10,78 160,198""#))
        #expect(rendered.contains(#"fill="lime""#))
        #expect(rendered.contains(#"stroke="purple""#))
        #expect(rendered.contains(#"stroke-width="1""#))
        #expect(rendered.contains(#"</polygon>"#))
    }

    @Test
    func `Polyline renders correctly`() {
        let svg = polyline(points: "20,20 40,25 60,40 80,120 120,140 200,180")
            .fill("none")
            .stroke("black")
            .strokeWidth(3)

        let rendered = String(svg)
        #expect(rendered.contains(#"<polyline"#))
        #expect(rendered.contains(#"points="20,20 40,25 60,40 80,120 120,140 200,180""#))
        #expect(rendered.contains(#"fill="none""#))
        #expect(rendered.contains(#"stroke="black""#))
        #expect(rendered.contains(#"stroke-width="3""#))
        #expect(rendered.contains(#"</polyline>"#))
    }
}
