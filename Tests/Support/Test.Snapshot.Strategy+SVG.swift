public import SVG_Rendering
public import Test

extension Test::Test.Snapshot.Strategy where Value: SVG.View, Format == String {
    public static var svg: Self {
        .svg()
    }

    public static func svg(
        configuration: SVG.Context.Configuration = .pretty
    ) -> Self {
        Test::Test.Snapshot.Strategy<String, String>.lines.pullback { value in
            String(value, configuration: configuration)
        }
    }
}
