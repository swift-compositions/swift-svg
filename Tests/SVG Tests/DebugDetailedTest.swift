import Space_Test_Support
import SVG
import Testing

@Suite
struct `Debug Detailed` {

    @Test
    func `Detailed attribute flow`() {

        let circleElement = circle(cx: 50, cy: 50, r: 40)
            .fill("blue")
            .stroke("black")

        let circleRendered = String(circleElement)
        #expect(circleRendered.contains("<circle"))
        #expect(circleRendered.contains("fill=\"blue\""))
        #expect(circleRendered.contains("stroke=\"black\""))
        #expect(circleRendered.contains("cx=\"50"))
        #expect(circleRendered.contains("cy=\"50"))
        #expect(circleRendered.contains("r=\"40"))

        let chainedCircle = circle(cx: 50, cy: 50, r: 40)
            .fill("green")
            .stroke("red")
            .strokeWidth(2)
        let chainedResult = String(chainedCircle)
        #expect(chainedResult.contains("fill=\"green\""))
        #expect(chainedResult.contains("stroke=\"red\""))
        #expect(chainedResult.contains("stroke-width=\"2"))
    }
}
