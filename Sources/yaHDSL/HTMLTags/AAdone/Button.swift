public struct Button: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Button {
	func withDisabled(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disabled)
		} else {
			removeAttribute(named: .disabled)
		}
	}

	func withEnabled(_ flag: Bool) -> Self {
		withDisabled(!flag)
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withFormAction(_ url: String) -> Self {
		setAttribute(named: .formaction, value: url)
	}

	func withFormEncType(_ mimeEncodeType: String) -> Self {
		setAttribute(named: .formenctype, value: mimeEncodeType)
	}

	typealias FormMethod = Input.FormMethod
	func withFormMethod(_ method: FormMethod) -> Self {
		setAttribute(named: .formmethod, value: method)
	}

	func withFormNoValidate(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .formnovalidate)
		} else {
			removeAttribute(named: .formnovalidate)
		}
	}

	typealias Target = A.Target
	func withFormTarget(_ target: Target) -> Self {
		setAttribute(named: .formtarget, value: target)
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}

	typealias PopoverTargetAction = Input.PopoverTargetAction
	func withPopoverTargetAction(_ action: PopoverTargetAction) -> Self {
		setAttribute(named: .popovertargetaction, value: action)
	}

	struct ButtonType: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let submit = ButtonType(rawValue: "submit")
		public static let reset = ButtonType(rawValue: "reset")
		public static let button = ButtonType(rawValue: "button")
	}
	func withType(_ value: ButtonType) -> Self {
		setAttribute(named: .type, value: value)
	}

	func withValue(_ value: String) -> Self {
		setAttribute(named: .value, value: value)
	}
}
