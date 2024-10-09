public struct ClassValue: RawRepresentable, Sendable, Hashable, Comparable, ExpressibleByStringInterpolation, ExpressibleByStringLiteral {
	public var rawValue: String

	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public init(stringLiteral value: String) {
		self.init(rawValue: value)
	}

	public init(_ rawValue: String) {
		self.init(rawValue: rawValue)
	}

	public static func < (lhs: ClassValue, rhs: ClassValue) -> Bool {
		lhs.rawValue < rhs.rawValue
	}
}
