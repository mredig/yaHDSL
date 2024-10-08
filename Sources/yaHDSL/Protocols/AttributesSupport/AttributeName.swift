public struct AttributeName: RawRepresentable, Sendable, Hashable {
	public let rawValue: String

	public init(_ rawValue: String) throws(Error) {
		let noSpaces = rawValue
			.lowercased()
			.replacingOccurrences(of: " ", with: "-")
		guard
			noSpaces.allSatisfy({ $0.unicodeScalars.allSatisfy({ CharacterMapper.attributeNameAllowedCharacters.contains($0) }) })
		else { throw .invalidCharacterInName(noSpaces) }

		self.rawValue = noSpaces
	}

	public init?(rawValue: String) {
		try? self.init(rawValue)
	}

	public enum Error: Swift.Error {
		case invalidCharacterInName(String)
	}
}

public extension AttributeName {
	static let href = AttributeName(rawValue: "href")!
	static let download = AttributeName(rawValue: "download")!
	static let hreflang = AttributeName(rawValue: "hreflang")!
	static let ping = AttributeName(rawValue: "ping")!
	static let referrerpolicy = AttributeName(rawValue: "referrerpolicy")!
	static let rel = AttributeName(rawValue: "rel")!
	static let target = AttributeName(rawValue: "target")!
	static let type = AttributeName(rawValue: "type")!
	static let alt = AttributeName(rawValue: "alt")!
	static let coords = AttributeName(rawValue: "coords")!
	static let media = AttributeName(rawValue: "media")!
	static let shape = AttributeName(rawValue: "shape")!
	static let autoplay = AttributeName(rawValue: "autoplay")!
	static let controls = AttributeName(rawValue: "controls")!
	static let loop = AttributeName(rawValue: "loop")!
	static let muted = AttributeName(rawValue: "muted")!
	static let preload = AttributeName(rawValue: "preload")!
	static let src = AttributeName(rawValue: "src")!
	static let cite = AttributeName(rawValue: "cite")!
	static let sizes = AttributeName(rawValue: "sizes")!
	static let srcset = AttributeName(rawValue: "srcset")!
	static let disabled = AttributeName(rawValue: "disabled")!
	static let form = AttributeName(rawValue: "form")!
	static let formaction = AttributeName(rawValue: "formaction")!
	static let formenctype = AttributeName(rawValue: "formenctype")!
	static let formmethod = AttributeName(rawValue: "formmethod")!
	static let formnovalidate = AttributeName(rawValue: "formnovalidate")!
	static let formtarget = AttributeName(rawValue: "formtarget")!
	static let name = AttributeName(rawValue: "name")!
	static let popovertarget = AttributeName(rawValue: "popovertarget")!
	static let popovertargetaction = AttributeName(rawValue: "popovertargetaction")!
	static let value = AttributeName(rawValue: "value")!
	static let height = AttributeName(rawValue: "height")!
	static let width = AttributeName(rawValue: "width")!
	static let span = AttributeName(rawValue: "span")!
	static let label = AttributeName(rawValue: "label")!
	static let selected = AttributeName(rawValue: "selected")!
	static let datetime = AttributeName(rawValue: "datetime")!
	static let open = AttributeName(rawValue: "open")!
	static let `for` = AttributeName(rawValue: "for")!
	static let accept = AttributeName(rawValue: "accept")!
	static let autocomplete = AttributeName(rawValue: "autocomplete")!
	static let capture = AttributeName(rawValue: "capture")!
	static let checked = AttributeName(rawValue: "checked")!
	static let dirname = AttributeName(rawValue: "dirname")!
	static let list = AttributeName(rawValue: "list")!
	static let max = AttributeName(rawValue: "max")!
	static let maxlength = AttributeName(rawValue: "maxlength")!
	static let min = AttributeName(rawValue: "min")!
	static let minlength = AttributeName(rawValue: "minlength")!
	static let multiple = AttributeName(rawValue: "multiple")!
	static let pattern = AttributeName(rawValue: "pattern")!
	static let placeholder = AttributeName(rawValue: "placeholder")!
	static let readonly = AttributeName(rawValue: "readonly")!
	static let required = AttributeName(rawValue: "required")!
	static let size = AttributeName(rawValue: "size")!
	static let step = AttributeName(rawValue: "step")!
	static let action = AttributeName(rawValue: "action")!
	static let enctype = AttributeName(rawValue: "enctype")!
	static let method = AttributeName(rawValue: "method")!
	static let novalidate = AttributeName(rawValue: "novalidate")!
	static let acceptcharset = AttributeName(rawValue: "accept-charset")!
}
