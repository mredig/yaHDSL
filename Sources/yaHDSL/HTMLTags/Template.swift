public struct Template: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Template {
	struct ShadowRootMode: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let open = ShadowRootMode(rawValue: "open")
		public static let closed = ShadowRootMode(rawValue: "closed")
	}
	func withShadowRootMode(_ mode: ShadowRootMode) -> Self {
		setAttribute(named: .shadowrootmode, value: mode)
	}

	func withShadowRootClonable(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .shadowrootclonable)
		} else {
			removeAttribute(named: .shadowrootclonable)
		}
	}

	func withShadowRootDelegatesFocus(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .shadowrootdelegatesfocus)
		} else {
			removeAttribute(named: .shadowrootdelegatesfocus)
		}
	}
}
