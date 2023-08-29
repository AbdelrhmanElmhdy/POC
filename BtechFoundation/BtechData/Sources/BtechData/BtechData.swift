public struct BtechData {
    private(set) static var config: Config?

    public static func setup(with config: Config) {
        Self.config = config
    }
}
