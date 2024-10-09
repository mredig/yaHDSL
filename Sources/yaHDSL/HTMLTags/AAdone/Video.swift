#if canImport(Foundation)
import Foundation
#endif

public struct Video: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Video {
	func withAutoplay(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .autoplay)
		} else {
			removeAttribute(named: .autoplay)
		}
	}

	func withControls(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .controls)
		} else {
			removeAttribute(named: .controls)
		}
	}

	struct ControlListItem: RawRepresentable, Sendable, Hashable, ExpressibleByStringLiteral {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public init(stringLiteral value: StringLiteralType) {
			self.init(rawValue: value)
		}

		public enum BlocklistToken {
			public static let noFullscreen = ControlListItem(rawValue: "nofullscreen")
			public static let noDownload = ControlListItem(rawValue: "nodownload")
			public static let noRemotePlayback = ControlListItem(rawValue: "noremoteplayback")
			public static let noPlaybackRate = ControlListItem(rawValue: "noplaybackrate")
		}

		public enum AllowlistToken {
			public static let play = ControlListItem(rawValue: "play")
			public static let timeline = ControlListItem(rawValue: "timeline")
			public static let volume = ControlListItem(rawValue: "volume")
		}
	}
	func withControlsList(_ tokens: Set<ControlListItem>) -> Self {
		setAttribute(named: .controlslist, value: .list(tokens.map(\.rawValue)))
	}

	func withControlsList(_ tokens: [ControlListItem]) -> Self {
		withControlsList(Set(tokens))
	}

	func withControlsList(_ token: ControlListItem) -> Self {
		withControlsList([token])
	}

	typealias CrossOriginPolicy = Img.CrossOriginPolicy
	func withCrossOrigin(_ policy: CrossOriginPolicy) -> Self {
		setAttribute(named: .crossorigin, value: policy)
	}

	func withDisablePictureInPicture(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disablepictureinpicture)
		} else {
			removeAttribute(named: .disablepictureinpicture)
		}
	}

	func withDisableRemotePlayback(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disableremoteplayback)
		} else {
			removeAttribute(named: .disableremoteplayback)
		}
	}

	func withHeight(_ value: Int) -> Self {
		setAttribute(named: .height, value: value)
	}

	func withLoop(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .loop)
		} else {
			removeAttribute(named: .loop)
		}
	}

	func withMuted(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .muted)
		} else {
			removeAttribute(named: .muted)
		}
	}

	func withPlaysInline(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .playsinline)
		} else {
			removeAttribute(named: .playsinline)
		}
	}

	func withPoster(_ url: String) -> Self {
		setAttribute(named: .poster, value: url)
	}

	#if canImport(Foundation)
	func withPoster(_ url: URL) -> Self {
		setAttribute(named: .poster, value: url.absoluteString)
	}
	#endif

	struct PreloadIntent: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let none = PreloadIntent(rawValue: "none")
		public static let metadata = PreloadIntent(rawValue: "metadata")
		public static let auto = PreloadIntent(rawValue: "auto")
	}
	func withPreload(_ intent: PreloadIntent) -> Self {
		setAttribute(named: .preload, value: intent)
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	func withWidth(_ value: Int) -> Self {
		setAttribute(named: .width, value: value)
	}
}
