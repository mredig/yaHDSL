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
	static let href = try! AttributeName("href")
	static let download = try! AttributeName("download")
	static let hreflang = try! AttributeName("hreflang")
	static let ping = try! AttributeName("ping")
	static let referrerpolicy = try! AttributeName("referrerpolicy")
	static let rel = try! AttributeName("rel")
	static let target = try! AttributeName("target")
	static let type = try! AttributeName("type")
	static let alt = try! AttributeName("alt")
	static let coords = try! AttributeName("coords")
	static let media = try! AttributeName("media")
	static let shape = try! AttributeName("shape")

	static let autoplay = AttributeName(rawValue: "autoplay")!
	static let controls = AttributeName(rawValue: "controls")!
	static let loop = AttributeName(rawValue: "loop")!
	static let muted = AttributeName(rawValue: "muted")!
	static let preload = AttributeName(rawValue: "preload")!
	static let src = AttributeName(rawValue: "src")!
	static let cite = AttributeName(rawValue: "cite")!

	static let sizes = AttributeName(rawValue: "sizes")!
	static let srcset = AttributeName(rawValue: "srcset")!
}
