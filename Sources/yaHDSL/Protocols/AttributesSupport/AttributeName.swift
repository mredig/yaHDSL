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
