public struct Textarea: HTMLTextContainer, GlobalAttributable, EventAttributable {
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.text = text
	}

	public init(
		text: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.text = text
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Textarea {
	typealias AutoCompleteMode = Input.AutoCompleteMode
	func withAutoComplete(_ mode: AutoCompleteMode) -> Self {
		setAttribute(named: .autocomplete, value: mode)
	}

	func withAutocorrect(_ flag: Bool) -> Self { // nonstandard case
		setAttribute(named: .autocorrect, value: flag ? "on" : "off")
	}

	func withCols(_ value: UInt) -> Self {
		setAttribute(named: .cols, value: value)
	}

	func withDirName(_ value: String) -> Self {
		setAttribute(named: .dirname, value: value)
	}

	func withDisabled(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disabled)
		} else {
			removeAttribute(named: .disabled)
		}
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withMaxLength(_ value: UInt) -> Self {
		setAttribute(named: .maxlength, value: value)
	}

	func withMinLength(_ value: UInt) -> Self {
		setAttribute(named: .minlength, value: value)
	}

	func withName(_ name: String) -> Self {
		setAttribute(named: .name, value: name)
	}

	func withPlaceholder(_ value: String) -> Self {
		setAttribute(named: .placeholder, value: value)
	}

	func withReadOnly(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .readonly)
		} else {
			removeAttribute(named: .readonly)
		}
	}

	func withRequired(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .required)
		} else {
			removeAttribute(named: .required)
		}
	}

	func withRows(_ value: UInt) -> Self {
		setAttribute(named: .rows, value: value)
	}

	func withSpellcheck(_ flag: Bool?) -> Self {
		guard let flag else { return self }
		return setAttribute(named: .spellcheck, value: .bool(flag))
	}


	struct WrapMode: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let hard = WrapMode(rawValue: "hard")
		public static let soft = WrapMode(rawValue: "soft")
		public static let off = WrapMode(rawValue: "off")
	}
	func withWrap(_ mode: WrapMode) -> Self {
		setAttribute(named: .wrap, value: mode)
	}
}
