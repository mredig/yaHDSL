public protocol GlobalAttributable: ClassAttributable {}

public extension GlobalAttributable {
	func setAccessKey(_ key: Character) -> Self {
		setAttribute(named: .accessKey, value: "\(key)")
	}

	func setAutofocus(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .autoFocus)
		} else {
			removeAttribute(named: .autoFocus)
		}
	}

	func setContentEditable(_ flag: Bool) -> Self {
		setAttribute(named: .contentEditable, value: .bool(flag))
	}

	func setData(named name: String, _ value: String) throws(AttributeName.Error) -> Self {
		try setAttribute(named: .data(name), value: value)
	}

	func setTextdirection(_ dir: TextDirection) -> Self {
		setAttribute(named: .dir, value: dir)
	}

	func setDraggable(_ flag: Bool) -> Self {
		setAttribute(named: .draggable, value: .bool(flag))
	}

	func setEnterKeyHint(_ hint: EnterKeyHint) -> Self {
		setAttribute(named: .enterKeyHint, value: hint)
	}

	func setIsHidden(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .hidden)
		} else {
			removeAttribute(named: .hidden)
		}
	}

	func setIsVisible(_ flag: Bool) -> Self {
		setIsHidden(!flag)
	}

	func setID(_ id: String) -> Self {
		setAttribute(named: .id, value: id)
	}

	func setIsInert(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .inert)
		} else {
			removeAttribute(named: .inert)
		}
	}

	func setInputMode(_ mode: KeyboardInputMode) -> Self {
		setAttribute(named: .inputMode, value: mode)
	}

	typealias LangCode = String
	func setLang(_ langCode: LangCode) -> Self {
		setAttribute(named: .lang, value: langCode)
	}

	func setPopover(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .popover)
		} else {
			removeAttribute(named: .popover)
		}
	}

	func setPopoverTarget(_ targetID: String) -> Self {
		setAttribute(named: .popoverTarget, value: targetID)
	}

	func setSpellcheck(_ flag: Bool) -> Self {
		setAttribute(named: .spellcheck, value: .bool(flag))
	}

	func setStyle(_ customCSS: String) -> Self {
		setAttribute(named: .style, value: customCSS)
	}

	func setTabIndex(_ index: Int) -> Self {
		setAttribute(named: .tabIndex, value: index)
	}

	func setTitleAttribute(_ title: String) -> Self {
		setAttribute(named: .title, value: title)
	}

	func setTranslate(_ flag: Bool) -> Self {
		setAttribute(named: .translate, value: flag ? "yes" : "no")
	}
}

public struct TextDirection: RawRepresentable, Sendable, Hashable {
	public var rawValue: String
	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public static let ltr = TextDirection(rawValue: "ltr")
	public static let rtl = TextDirection(rawValue: "rtl")
	public static let auto = TextDirection(rawValue: "auto")
}

public struct EnterKeyHint: RawRepresentable, Sendable, Hashable {
	public var rawValue: String
	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public static let done = EnterKeyHint(rawValue: "done")
	public static let enter = EnterKeyHint(rawValue: "enter")
	public static let go = EnterKeyHint(rawValue: "go")
	public static let next = EnterKeyHint(rawValue: "next")
	public static let previous = EnterKeyHint(rawValue: "previous")
	public static let search = EnterKeyHint(rawValue: "search")
	public static let send = EnterKeyHint(rawValue: "send")
}

public struct KeyboardInputMode: RawRepresentable, Sendable, Hashable {
	public var rawValue: String
	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public static let decimal = KeyboardInputMode(rawValue: "decimal")
	public static let email = KeyboardInputMode(rawValue: "email")
	public static let none = KeyboardInputMode(rawValue: "none")
	public static let numeric = KeyboardInputMode(rawValue: "numeric")
	public static let search = KeyboardInputMode(rawValue: "search")
	public static let tel = KeyboardInputMode(rawValue: "tel")
	public static let text = KeyboardInputMode(rawValue: "text")
	public static let url = KeyboardInputMode(rawValue: "url")
}

extension AttributeName {
	public static let accessKey = AttributeName(rawValue: "accesskey")!
	public static let autoFocus = AttributeName(rawValue: "autofocus")!
	public static let `class` = AttributeName(rawValue: "class")!
	public static let contentEditable = AttributeName(rawValue: "contenteditable")!
	public static let dir = AttributeName(rawValue: "dir")!
	public static let draggable = AttributeName(rawValue: "draggable")!
	public static let enterKeyHint = AttributeName(rawValue: "enterkeyhint")!
	public static let hidden = AttributeName(rawValue: "hidden")!
	public static let id = AttributeName(rawValue: "id")!
	public static let inert = AttributeName(rawValue: "inert")!
	public static let inputMode = AttributeName(rawValue: "inputmode")!
	public static let lang = AttributeName(rawValue: "lang")!
	public static let popover = AttributeName(rawValue: "popover")!
	public static let popoverTarget = AttributeName(rawValue: "popovertarget")!
	public static let spellcheck = AttributeName(rawValue: "spellcheck")!
	public static let style = AttributeName(rawValue: "style")!
	public static let tabIndex = AttributeName(rawValue: "tabindex")!
	public static let title = AttributeName(rawValue: "title")!
	public static let translate = AttributeName(rawValue: "translate")!

	public static func data(_ name: String) throws(Error) -> AttributeName {
		try AttributeName("data-\(name)")
	}
}
