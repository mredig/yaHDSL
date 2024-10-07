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
}
