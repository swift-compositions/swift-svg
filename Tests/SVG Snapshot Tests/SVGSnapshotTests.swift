import SVG_Test_Support
import Tests_Inline_Snapshot

@Suite
struct `SVG Snapshot Tests` {

    @Test
    func `Circle element snapshot`() {
        snapshot(
            testSVG(width: 100, height: 100) {
                circle(cx: 50, cy: 50, r: 40)
                    .fill("red")
                    .stroke("black")
                    .strokeWidth(2)
            },
            as: .svg
        ) {
            """
            <svg height="100" width="100">
              <circle stroke-width="2" stroke="black" fill="red" r="40" cy="50" cx="50">
              </circle>
            </svg>
            """
        }
    }

    @Test
    func `Rectangle element snapshot`() {
        snapshot(
            testSVG(width: 120, height: 80) {
                rect(x: 10, y: 10, width: 100, height: 60)
                    .rx(5 as Double)
                    .ry(5 as Double)
                    .fill("blue")
                    .opacity(0.7)
            },
            as: .svg
        ) {
            """
            <svg height="80" width="120">
              <rect opacity="0.7" fill="blue" ry="5" rx="5" height="60" width="100" y="10" x="10">
              </rect>
            </svg>
            """
        }
    }

    @Test
    func `Ellipse element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 100) {
                ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
                    .fill("green")
                    .strokeWidth(3)
                    .stroke("purple")
            },
            as: .svg
        ) {
            """
            <svg height="100" width="200">
              <ellipse stroke="purple" stroke-width="3" fill="green" ry="40" rx="80" cy="50" cx="100">
              </ellipse>
            </svg>
            """
        }
    }

    @Test
    func `Line element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                line(x1: 10, y1: 10, x2: 190, y2: 190)
                    .stroke("red")
                    .strokeWidth(2)
                    .strokeDasharray("5 5")
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <line stroke-dasharray="5 5" stroke-width="2" stroke="red" y2="190" x2="190" y1="10" x1="10">
              </line>
            </svg>
            """
        }
    }

    @Test
    func `Polygon element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                polygon(coordinates: [(100, 10), (40, 198), (190, 78), (10, 78), (160, 198)])
                    .fill("lime")
                    .stroke("purple")
                    .strokeWidth(1)
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <polygon stroke-width="1" stroke="purple" fill="lime" points="100,10 40,198 190,78 10,78 160,198">
              </polygon>
            </svg>
            """
        }
    }

    @Test
    func `Polyline element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                polyline(points: "20,20 40,25 60,40 80,120 120,140 200,180")
                    .fill("none")
                    .stroke("black")
                    .strokeWidth(3)
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <polyline stroke-width="3" stroke="black" fill="none" points="20,20 40,25 60,40 80,120 120,140 200,180">
              </polyline>
            </svg>
            """
        }
    }

    @Test
    func `Path element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                path(d: "M 10 10 L 90 10 L 50 80 Z")
                    .fill("orange")
                    .stroke("black")
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <path stroke="black" fill="orange" d="M 10 10 L 90 10 L 50 80 Z">
              </path>
            </svg>
            """
        }
    }

    @Test
    func `Group element snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                g {
                    circle(cx: 50, cy: 50, r: 30)
                        .fill("red")
                        .opacity(0.5)
                    rect(x: 100, y: 100, width: 80, height: 60)
                        .fill("red")
                        .opacity(0.5)
                }
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <g>
                <circle opacity="0.5" fill="red" r="30" cy="50" cx="50">
                </circle>
                <rect opacity="0.5" fill="red" height="60" width="80" y="100" x="100">
                </rect>
              </g>
            </svg>
            """
        }
    }

    @Test
    func `Nested groups snapshot`() {
        snapshot(
            testSVG(width: 300, height: 200) {
                g {
                    g {
                        circle(cx: 0, cy: 0, r: 20)
                            .fill("blue")
                        rect(x: 30, y: -10, width: 40, height: 20)
                            .fill("blue")
                    }
                    .transform("translate(50, 50)")

                    g {
                        rect(x: -15, y: -15, width: 30, height: 30)
                            .fill("green")
                    }
                    .transform("rotate(45)")
                }
            },
            as: .svg
        ) {
            """
            <svg height="200" width="300">
              <g>
                <g transform="translate(50, 50)">
                  <circle fill="blue" r="20" cy="0" cx="0">
                  </circle>
                  <rect fill="blue" height="20" width="40" y="-10" x="30">
                  </rect>
                </g>
                <g transform="rotate(45)">
                  <rect fill="green" height="30" width="30" y="-15" x="-15">
                  </rect>
                </g>
              </g>
            </svg>
            """
        }
    }

    @Test
    func `Text element snapshot`() {
        snapshot(
            testSVG(width: 300, height: 100) {
                text(x: 10, y: 30) {
                    "Hello, SVG!"
                }
                .fontFamily("Arial")
                .fontSize(24)
                .fill("black")
            },
            as: .svg
        ) {
            """
            <svg height="100" width="300">
              <text fill="black" font-size="24" font-family="Arial" y="30" x="10">Hello, SVG!
              </text>
            </svg>
            """
        }
    }

    @Test
    func `Text with tspan snapshot`() {
        snapshot(
            testSVG(width: 300, height: 100) {
                text(x: 10, y: 30) {
                    tspan { "First line" }
                    tspan(x: 10, dy: 20) {
                        "Second line"
                    }
                    .fill("red")
                    tspan(x: 10, dy: 20) {
                        "Third line"
                    }
                    .fontWeight("bold")
                }
                .fontSize(16)
            },
            as: .svg
        ) {
            """
            <svg height="100" width="300">
              <text font-size="16" y="30" x="10">
                <tspan>First line
                </tspan>
                <tspan fill="red" dy="20" x="10">Second line
                </tspan>
                <tspan font-weight="bold" dy="20" x="10">Third line
                </tspan>
              </text>
            </svg>
            """
        }
    }

    @Test
    func `Linear gradient snapshot`() {
        snapshot(
            testSVG(width: 200, height: 100) {
                defs {
                    linearGradient(
                        id: "grad1",
                        x1: "0%",
                        y1: "0%",
                        x2: "100%",
                        y2: "0%"
                    ) {
                        stop(offset: "0%", stopColor: "rgb(255,255,0)")
                        stop(offset: "100%", stopColor: "rgb(255,0,0)")
                    }
                }

                rect(x: 10, y: 10, width: 180, height: 80)
                    .fill("url(#grad1)")
            },
            as: .svg
        ) {
            """
            <svg height="100" width="200">
              <defs>
                <linearGradient y2="0%" x2="100%" y1="0%" x1="0%" id="grad1">
                  <stop stop-color="rgb(255,255,0)" offset="0%">
                  </stop>
                  <stop stop-color="rgb(255,0,0)" offset="100%">
                  </stop>
                </linearGradient>
              </defs>
              <rect fill="url(#grad1)" height="80" width="180" y="10" x="10">
              </rect>
            </svg>
            """
        }
    }

    @Test
    func `Radial gradient snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                defs {
                    radialGradient(
                        id: "grad2",
                        cx: "50%",
                        cy: "50%",
                        r: "50%"
                    ) {
                        stop(offset: "0%", stopColor: "white")
                        stop(offset: "100%", stopColor: "blue")
                    }
                }

                circle(cx: 100, cy: 100, r: 80)
                    .fill("url(#grad2)")
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <defs>
                <radialGradient r="50%" cy="50%" cx="50%" id="grad2">
                  <stop stop-color="white" offset="0%">
                  </stop>
                  <stop stop-color="blue" offset="100%">
                  </stop>
                </radialGradient>
              </defs>
              <circle fill="url(#grad2)" r="80" cy="100" cx="100">
              </circle>
            </svg>
            """
        }
    }

    @Test
    func `Transform combinations snapshot`() {
        snapshot(
            testSVG(width: 300, height: 300) {
                rect(x: 50, y: 50, width: 100, height: 100)
                    .fill("red")
                    .transform("translate(100, 100) rotate(45) scale(0.5, 0.5)")
            },
            as: .svg
        ) {
            """
            <svg height="300" width="300">
              <rect transform="translate(100, 100) rotate(45) scale(0.5, 0.5)" fill="red" height="100" width="100" y="50" x="50">
              </rect>
            </svg>
            """
        }
    }

    @Test
    func `ClipPath snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                defs {
                    clipPath(id: "clip1") {
                        circle(cx: 100, cy: 100, r: 50)
                    }
                }

                rect(x: 0, y: 0, width: 200, height: 200)
                    .fill("blue")
                    .clipPath("url(#clip1)")
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <defs>
                <clipPath id="clip1">
                  <circle r="50" cy="100" cx="100">
                  </circle>
                </clipPath>
              </defs>
              <rect clip-path="url(#clip1)" fill="blue" height="200" width="200" y="0" x="0">
              </rect>
            </svg>
            """
        }
    }

    @Test
    func `Mask snapshot`() {
        snapshot(
            testSVG(width: 200, height: 200) {
                defs {
                    mask(id: "mask1") {
                        rect(x: 0, y: 0, width: 200, height: 200)
                            .fill("white")
                        circle(cx: 100, cy: 100, r: 50)
                            .fill("black")
                    }
                }

                rect(x: 0, y: 0, width: 200, height: 200)
                    .fill("red")
                    .mask("url(#mask1)")
            },
            as: .svg
        ) {
            """
            <svg height="200" width="200">
              <defs>
                <mask id="mask1">
                  <rect fill="white" height="200" width="200" y="0" x="0">
                  </rect>
                  <circle fill="black" r="50" cy="100" cx="100">
                  </circle>
                </mask>
              </defs>
              <rect mask="url(#mask1)" fill="red" height="200" width="200" y="0" x="0">
              </rect>
            </svg>
            """
        }
    }

    @Test
    func `Complex SVG composition snapshot`() {
        snapshot(
            testSVG(
                width: 400,
                height: 300,
                viewBox: SVG_Standard.Types.ViewBox(minX: 0, minY: 0, width: 400, height: 300)
            ) {
                defs {
                    linearGradient(id: "bg-gradient", x1: "0%", y1: "0%", x2: "100%", y2: "100%") {
                        stop(offset: "0%", stopColor: "#667eea")
                        stop(offset: "100%", stopColor: "#764ba2")
                    }

                    clipPath(id: "star-clip") {
                        path(
                            d:
                                "M50,5 L61,35 L95,35 L69,57 L80,91 L50,70 L20,91 L31,57 L5,35 L39,35 Z"
                        )
                    }
                }

                rect(x: 0, y: 0, width: 400, height: 300)
                    .fill("url(#bg-gradient)")

                g {
                    rect(x: 0, y: 0, width: 100, height: 100)
                        .fill("yellow")
                }
                .clipPath("url(#star-clip)")
                .transform("translate(150, 100) scale(2, 2)")

                text(x: 200, y: 250) {
                    "SVG Snapshot Testing"
                }
                .fontFamily("Arial")
                .fontSize(24)
                .fill("white")
                .textAnchor("middle")
            },
            as: .svg
        ) {
            """
            <svg viewBox="0 0 400 300" height="300" width="400">
              <defs>
                <linearGradient y2="100%" x2="100%" y1="0%" x1="0%" id="bg-gradient">
                  <stop stop-color="#667eea" offset="0%">
                  </stop>
                  <stop stop-color="#764ba2" offset="100%">
                  </stop>
                </linearGradient>
                <clipPath id="star-clip">
                  <path d="M50,5 L61,35 L95,35 L69,57 L80,91 L50,70 L20,91 L31,57 L5,35 L39,35 Z">
                  </path>
                </clipPath>
              </defs>
              <rect fill="url(#bg-gradient)" height="300" width="400" y="0" x="0">
              </rect>
              <g transform="translate(150, 100) scale(2, 2)" clip-path="url(#star-clip)">
                <rect fill="yellow" height="100" width="100" y="0" x="0">
                </rect>
              </g>
              <text text-anchor="middle" fill="white" font-size="24" font-family="Arial" y="250" x="200">SVG Snapshot Testing
              </text>
            </svg>
            """
        }
    }
}
