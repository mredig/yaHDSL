public struct Svg: HTMLTextContainer, GlobalAttributable, EventAttributable {
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.init(text: text, attributes: [:], attributesOptions: nil)
	}

	public init(
		text: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
		self.text = text
	}
}

public extension Svg {
	func withHeight(_ value: Int) -> Self {
		setAttribute(named: .height, value: value)
	}

	struct AspectRatioMode: RawRepresentable, Sendable, Hashable {
		public var xyMode: XYMode
		public var meetSliceMode: MeetSliceMode

		public var rawValue: String { [xyMode.rawValue, meetSliceMode.rawValue].joined(separator: " ") }

		public init(xyMode: XYMode, meetSliceMode: MeetSliceMode) {
			self.xyMode = xyMode
			self.meetSliceMode = meetSliceMode
		}

		public init?(rawValue: String) {
			let parts = rawValue.split(separator: " ").map(String.init)
			guard parts.count == 2 else { return nil }
			self.init(
				xyMode: XYMode(rawValue: parts[0]),
				meetSliceMode: MeetSliceMode(rawValue: parts[1]))
		}

		public struct XYMode: RawRepresentable, Sendable, Hashable {
			public var rawValue: String
			public init(rawValue: String) {
				self.rawValue = rawValue
			}
			public static let none = XYMode(rawValue: "none")
			public static let xMinYMin = XYMode(rawValue: "xMinYMin")
			public static let xMidYMin = XYMode(rawValue: "xMidYMin")
			public static let xMaxYMin = XYMode(rawValue: "xMaxYMin")
			public static let xMinYMid = XYMode(rawValue: "xMinYMid")
			public static let xMidYMid = XYMode(rawValue: "xMidYMid")
			public static let xMaxYMid = XYMode(rawValue: "xMaxYMid")
			public static let xMinYMax = XYMode(rawValue: "xMinYMax")
			public static let xMidYMax = XYMode(rawValue: "xMidYMax")
			public static let xMaxYMax = XYMode(rawValue: "xMaxYMax")
		}

		public struct MeetSliceMode: RawRepresentable, Sendable, Hashable {
			public var rawValue: String
			public init(rawValue: String) {
				self.rawValue = rawValue
			}
			public static let meet = MeetSliceMode(rawValue: "meet")
			public static let slice = MeetSliceMode(rawValue: "slice")
		}
	}
	func withPreserveAspectRatio(_ mode: AspectRatioMode) -> Self {
		setAttribute(named: .init(rawValue: "preserveAspectRatio")!, value: mode)
	}

	func withViewBox(_ coords: [Int]) -> Self {
		setAttribute(named: AttributeName(rawValue: "viewBox")!, value: .list(coords.map(String.init)))
	}

	func withWidth(_ value: Int) -> Self {
		setAttribute(named: .width, value: value)
	}

	func withX(_ value: Int) -> Self {
		setAttribute(named: AttributeName(rawValue: "x")!, value: value)
	}

	func withY(_ value: Int) -> Self {
		setAttribute(named: AttributeName(rawValue: "y")!, value: value)
	}
}
