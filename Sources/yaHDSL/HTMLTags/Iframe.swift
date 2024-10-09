#if canImport(Foundation)
import Foundation
#endif

public struct Iframe: HTMLNode, GlobalAttributable, EventAttributable {
	public var tag: String? { "iframe" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	#if canImport(Foundation)
	public init(
		src: URL,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.init(src: src.absoluteString, attributes: attributes, attributesOptions: attributesOptions)
	}
	#endif

	public init(
		src: String,
		attributes: [AttributeName : AttributeValue],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
		self = withSrc(src)
	}

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		let openingTag = {
			if let tag = tag {
				if let attributeContent = renderAttributes() {
					"<\(tag) \(attributeContent)>"
				} else {
					"<\(tag)>"
				}
			} else {
				""
			}
		}()
		let closingTag = {
			tag.map { "</\($0)>" } ?? ""
		}()

		switch context.mode {
		case .minify:
			return "\(openingTag)\(closingTag)"
		case .pretty(let indentation):
			let totalIndentation = String(repeating: indentation, count: context.depth)
			return "\(totalIndentation)\(openingTag)\n\(totalIndentation)\(closingTag)"
		}
	}
}

public extension Iframe {
	/// see [docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Permissions_Policy) for how to use this
	func withAllow(_ value: String) -> Self {
		setAttribute(named: .allow, value: value)
	}

	func withAllowFullscreen(_ flag: Bool) -> Self {
		setAttribute(named: .allowfullscreen, value: .bool(flag))
	}

	/// see [docs](https://developer.mozilla.org/en-US/docs/Web/API/HTMLIFrameElement/csp) for how to use this
	func withCsp(_ csp: String) -> Self {
		setAttribute(named: .csp, value: csp)
	}

	func withHeight(_ value: Int) -> Self {
		setAttribute(named: .height, value: value)
	}

	struct LoadingMode: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let eager = LoadingMode(rawValue: "eager")
		public static let lazy = LoadingMode(rawValue: "lazy")
	}
	func withLoading(_ mode: LoadingMode) -> Self {
		setAttribute(named: .loading, value: mode)
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}

	typealias ReferrerPolicy = A.ReferrerPolicy
	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy)
	}

	struct Sandbox: RawRepresentable, Sendable, Hashable, ExpressibleByArrayLiteral {
		public var rawValue: Set<Policy>

		public init(rawValue: Set<Policy>) {
			self.rawValue = rawValue
		}

		public init(_ content: Set<Policy>) {
			self.init(rawValue: content)
		}

		public init(_ content: Policy) {
			self.init(rawValue: Set([content]))
		}

		public init(arrayLiteral elements: Policy...) {
			self.init(rawValue: Set(elements))
		}

		public struct Policy: RawRepresentable, Sendable, Hashable {
			public var rawValue: String
			public init(rawValue: String) {
				self.rawValue = rawValue
			}

			public static let allowDownloads = Policy(rawValue: "allow-downloads")
			public static let allowForms = Policy(rawValue: "allow-forms")
			public static let allowModals = Policy(rawValue: "allow-modals")
			public static let allowOrientationLock = Policy(rawValue: "allow-orientation-lock")
			public static let allowPointerLock = Policy(rawValue: "allow-pointer-lock")
			public static let allowPopups = Policy(rawValue: "allow-popups")
			public static let allowPopupsToEscapeSandbox = Policy(rawValue: "allow-popups-to-escape-sandbox")
			public static let allowPresentation = Policy(rawValue: "allow-presentation")
			public static let allowSameOrigin = Policy(rawValue: "allow-same-origin")
			public static let allowScripts = Policy(rawValue: "allow-scripts")
			public static let allowStorageAccessByUserActivationExperimental = Policy(rawValue: "allow-storage-access-by-user-activation Experimental")
			public static let allowTopNavigation = Policy(rawValue: "allow-top-navigation")
			public static let allowTopNavigationByUserActivation = Policy(rawValue: "allow-top-navigation-by-user-activation")
			public static let allowTopNavigationToCustomProtocols = Policy(rawValue: "allow-top-navigation-to-custom-protocols")
		}

		func toString() -> String {
			rawValue.map(\.rawValue).sorted().joined(separator: " ")
		}
	}
	func withSandbox(_ policies: Sandbox) -> Self {
		setAttribute(named: .sandbox, value: policies.toString())
	}

	func withSandbox(_ policy: Sandbox.Policy) -> Self {
		withSandbox(Sandbox(policy))
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	func withSrcdoc(_ doc: String) -> Self {
		setAttribute(named: .srcdoc, value: doc)
	}

	func withWidth(_ value: Int) -> Self {
		setAttribute(named: .width, value: value)
	}
}
