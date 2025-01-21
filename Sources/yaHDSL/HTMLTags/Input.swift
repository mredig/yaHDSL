#if canImport(Foundation)
import Foundation
#endif

public struct Input: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "input" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}

	public init(
		inputType: InputType,
		nameAndID: String,
		placeholder: String? = nil,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.init(
			inputType: inputType,
			name: nameAndID,
			id: nameAndID,
			placeholder: placeholder,
			attributes: attributes,
			attributesOptions: attributesOptions)
	}

	public init(
		inputType: InputType,
		name: String,
		id: String,
		placeholder: String? = nil,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.init(attributes: attributes, attributesOptions: attributesOptions)
		self = withType(inputType)
			.withName(name)
			.setID(id)

		guard let placeholder else { return }
		self = withPlaceholder(placeholder)
	}


	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}

	public struct InputType: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let button = InputType(rawValue: "button")
		public static let checkbox = InputType(rawValue: "checkbox")
		public static let color = InputType(rawValue: "color")
		public static let date = InputType(rawValue: "date")
		public static let datetimeLocal = InputType(rawValue: "datetime-local")
		public static let email = InputType(rawValue: "email")
		public static let file = InputType(rawValue: "file")
		public static let hidden = InputType(rawValue: "hidden")
		public static let image = InputType(rawValue: "image")
		public static let month = InputType(rawValue: "month")
		public static let number = InputType(rawValue: "number")
		public static let password = InputType(rawValue: "password")
		public static let radio = InputType(rawValue: "radio")
		public static let range = InputType(rawValue: "range")
		public static let reset = InputType(rawValue: "reset")
		public static let search = InputType(rawValue: "search")
		public static let submit = InputType(rawValue: "submit")
		public static let tel = InputType(rawValue: "tel")
		public static let text = InputType(rawValue: "text")
		public static let time = InputType(rawValue: "time")
		public static let url = InputType(rawValue: "url")
		public static let week = InputType(rawValue: "week")
	}
}

public extension Input {
	func withAccept(_ filetype: String) -> Self {
		setAttribute(named: .accept, value: filetype)
	}

	func withAlt(_ altDescription: String) -> Self {
		setAttribute(named: .alt, value: altDescription)
	}

	struct AutoCompleteMode: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public var tokens: [String] { rawValue.split(separator: " ").map(String.init) }

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let off = AutoCompleteMode(rawValue: "off")
		public static let on = AutoCompleteMode(rawValue: "on")
		public static func tokens(_ tokens: String...) -> AutoCompleteMode {
			AutoCompleteMode(rawValue: tokens.joined(separator: " "))
		}
		public static func tokens(_ tokens: AutoCompleteMode...) -> AutoCompleteMode {
			let allTokens = tokens.flatMap(\.tokens)
			return AutoCompleteMode(rawValue: allTokens.joined(separator: " "))
		}

		public static func tokenSection(named name: String) -> AutoCompleteMode {
			AutoCompleteMode(rawValue: "section-\(name)")
		}

		public enum Common: Sendable, Hashable {
			public static let shipping = AutoCompleteMode(rawValue: "shipping")
			public static let billing = AutoCompleteMode(rawValue: "billing")
			public static let home = AutoCompleteMode(rawValue: "home")
			public static let work = AutoCompleteMode(rawValue: "work")
			public static let mobile = AutoCompleteMode(rawValue: "mobile")
			public static let fax = AutoCompleteMode(rawValue: "fax")
			public static let page = AutoCompleteMode(rawValue: "page")
			public static let tel = AutoCompleteMode(rawValue: "tel")
			public static let telCountryCode = AutoCompleteMode(rawValue: "tel-country-code")
			public static let telNational = AutoCompleteMode(rawValue: "tel-national")
			public static let telAreaCode = AutoCompleteMode(rawValue: "tel-area-code")
			public static let telLocal = AutoCompleteMode(rawValue: "tel-local")
			public static let telExtension = AutoCompleteMode(rawValue: "tel-extension")
			public static let email = AutoCompleteMode(rawValue: "email")
			public static let impp = AutoCompleteMode(rawValue: "impp")
			public static let name = AutoCompleteMode(rawValue: "name")
			public static let honorificPrefix = AutoCompleteMode(rawValue: "honorific-prefix")
			public static let givenName = AutoCompleteMode(rawValue: "given-name")
			public static let additionalName = AutoCompleteMode(rawValue: "additional-name")
			public static let familyName = AutoCompleteMode(rawValue: "family-name")
			public static let honorificSuffix = AutoCompleteMode(rawValue: "honorific-suffix")
			public static let nickname = AutoCompleteMode(rawValue: "nickname")
			public static let username = AutoCompleteMode(rawValue: "username")
			public static let newPassword = AutoCompleteMode(rawValue: "new-password")
			public static let currentPassword = AutoCompleteMode(rawValue: "current-password")
			public static let oneTimeCode = AutoCompleteMode(rawValue: "one-time-code")
			public static let organizationTitle = AutoCompleteMode(rawValue: "organization-title")
			public static let organization = AutoCompleteMode(rawValue: "organization")
			public static let streetAddress = AutoCompleteMode(rawValue: "street-address")
			public static let addressLine1 = AutoCompleteMode(rawValue: "address-line1")
			public static let addressLine2 = AutoCompleteMode(rawValue: "address-line2")
			public static let addressLine3 = AutoCompleteMode(rawValue: "address-line3")
			public static let addressLevel4 = AutoCompleteMode(rawValue: "address-level4")
			public static let addressLevel3 = AutoCompleteMode(rawValue: "address-level3")
			public static let addressLevel2 = AutoCompleteMode(rawValue: "address-level2")
			public static let addressLevel1 = AutoCompleteMode(rawValue: "address-level1")
			public static let country = AutoCompleteMode(rawValue: "country")
			public static let countryName = AutoCompleteMode(rawValue: "country-name")
			public static let postalCode = AutoCompleteMode(rawValue: "postal-code")
			public static let ccName = AutoCompleteMode(rawValue: "cc-name")
			public static let ccGivenName = AutoCompleteMode(rawValue: "cc-given-name")
			public static let ccAdditionalName = AutoCompleteMode(rawValue: "cc-additional-name")
			public static let ccFamilyName = AutoCompleteMode(rawValue: "cc-family-name")
			public static let ccNumber = AutoCompleteMode(rawValue: "cc-number")
			public static let ccExp = AutoCompleteMode(rawValue: "cc-exp")
			public static let ccExpMonth = AutoCompleteMode(rawValue: "cc-exp-month")
			public static let ccExpYear = AutoCompleteMode(rawValue: "cc-exp-year")
			public static let ccCsc = AutoCompleteMode(rawValue: "cc-csc")
			public static let ccType = AutoCompleteMode(rawValue: "cc-type")
			public static let transactionCurrency = AutoCompleteMode(rawValue: "transaction-currency")
			public static let transactionAmount = AutoCompleteMode(rawValue: "transaction-amount")
			public static let language = AutoCompleteMode(rawValue: "language")
			public static let bday = AutoCompleteMode(rawValue: "bday")
			public static let bdayDay = AutoCompleteMode(rawValue: "bday-day")
			public static let bdayMonth = AutoCompleteMode(rawValue: "bday-month")
			public static let bdayYear = AutoCompleteMode(rawValue: "bday-year")
			public static let sex = AutoCompleteMode(rawValue: "sex")
			public static let url = AutoCompleteMode(rawValue: "url")
			public static let photo = AutoCompleteMode(rawValue: "photo")
			public static let webauthn = AutoCompleteMode(rawValue: "webauthn")
		}
	}

	/// Sets autocomplete mode.
	///
	/// For ease of use, you can set like:
	///
	/// ```swift
	/// Input(...).withAutoComplete(.tokens(.Common.billing, .Common.streetAddress))
	/// ```
	///
	func withAutoComplete(_ mode: AutoCompleteMode) -> Self {
		setAttribute(named: .autocomplete, value: mode)
	}

	struct CaptureMode: RawRepresentable, Sendable, Hashable {
		public let rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let user = CaptureMode(rawValue: "user")
		public static let environment = CaptureMode(rawValue: "environment")
	}
	func withCapture(_ mode: CaptureMode) -> Self {
		setAttribute(named: .capture, value: mode)
	}

	func withChecked(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .checked)
		} else {
			removeAttribute(named: .checked)
		}
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

	func withEnabled(_ flag: Bool) -> Self {
		withDisabled(!flag)
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withFormAction(_ url: String) -> Self {
		setAttribute(named: .formaction, value: url)
	}

	#if canImport(Foundation)
	func withFormAction(_ url: URL) -> Self {
		setAttribute(named: .formaction, value: url.absoluteString)
	}
	#endif
	
	typealias FormMethod = Form.Method
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

	func withHeight(_ height: Int) -> Self {
		setAttribute(named: .height, value: height)
	}

	/// The value given to the list attribute should be the id of a <datalist> element located in the same document.
	/// [more info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#list)
	func withList(_ id: String) -> Self {
		setAttribute(named: .list, value: id)
	}

	func withMax(_ value: String) -> Self {
		setAttribute(named: .max, value: value)
	}

	func withMaxLength(_ value: UInt) -> Self {
		setAttribute(named: .maxlength, value: value)
	}

	func withMin(_ value: String) -> Self {
		setAttribute(named: .min, value: value)
	}

	func withMinLength(_ value: UInt) -> Self {
		setAttribute(named: .minlength, value: value)
	}

	func withMultiple(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .multiple)
		} else {
			removeAttribute(named: .multiple)
		}
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}

	func withPattern(_ jsRegEx: String) -> Self {
		setAttribute(named: .pattern, value: jsRegEx)
	}

	func withPlaceholder(_ value: String) -> Self {
		setAttribute(named: .placeholder, value: value)
	}

	func withPopoverTarget(_ id: String) -> Self {
		setAttribute(named: .popovertarget, value: id)
	}

	struct PopoverTargetAction: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let hide = PopoverTargetAction(rawValue: "hide")
		public static let show = PopoverTargetAction(rawValue: "show")
		public static let toggle = PopoverTargetAction(rawValue: "toggle")
	}
	func withPopoverTargetAction(_ action: PopoverTargetAction) -> Self {
		setAttribute(named: .popovertargetaction, value: action)
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

	func withSize(_ value: UInt) -> Self {
		setAttribute(named: .size, value: value)
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	func withStep(_ value: Int) -> Self {
		setAttribute(named: .step, value: value)
	}

	func withStep(_ value: String) -> Self {
		setAttribute(named: .step, value: value)
	}

	func withType(_ type: InputType) -> Self {
		setAttribute(named: .type, value: type)
	}

	func withValue(_ value: String) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: Int) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: AttributeValue) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withWidth(_ value: Int) -> Self {
		setAttribute(named: .width, value: value)
	}
}
