#if canImport(Foundation)
import Foundation

public enum CharacterMapper {
	static nonisolated(unsafe) private let byCharacter: [String: CharacterMapping] = {
		let url = Bundle.module.url(forResource: "htmlCodesByCharacter", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		return try! JSONDecoder().decode([String: CharacterMapping].self, from: data)
	}()

	static nonisolated(unsafe) private let byName: [String: CharacterMapping] = {
		let url = Bundle.module.url(forResource: "htmlCodesByName", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		return try! JSONDecoder().decode([String: CharacterMapping].self, from: data)
	}()

	public struct CharacterMapping: Codable {
		public let name: String
		public let codePoints: [Int]
		public let characters: String
	}

	public static func mapping(forCharacter character: Character) -> CharacterMapping? {
		byCharacter["\(character)"]
	}

	public static func mapping(forName name: String) -> CharacterMapping? {
		byName[name]
	}

	public static func getName(for character: Character) -> String? {
		mapping(forCharacter: character)?.name
	}

	public static func preferName(for character: Character) -> String {
		if let existing = getName(for: character) {
			return existing
		} else {
			return getCode(for: character)
		}
	}

	public static func getCode(for character: Character) -> String {
		let ints = character.unicodeScalars.map(\.value)
		return ints
			.map { "&x\(String(format: "%05X", $0));" }
			.joined()
	}
}

public extension CharacterMapper {
	static let attributeValueAllowedCharacters: CharacterSet = {
		var start = CharacterSet.alphanumerics
		start.formUnion(.punctuationCharacters)
		start.formUnion(.whitespaces)
		start.remove(charactersIn: "\"'<>&;")
		return start
	}()

	static let attributeNameAllowedCharacters: CharacterSet = {
		var set = CharacterSet.alphanumerics
		set.formUnion(.punctuationCharacters)
		set.subtract(.whitespacesAndNewlines)
		set.subtract(.controlCharacters)
		set.subtract(.illegalCharacters)
		let null = UnicodeScalar(0)!
		let quoteMark = UnicodeScalar(0x22)!
		let aposrophe = UnicodeScalar(0x27)!
		let greaterThanSign = UnicodeScalar(0x3e)!
		let solidus = UnicodeScalar(0x2f)!
		let equalsSign = UnicodeScalar(0x3d)!

		set.remove(null)
		set.remove(quoteMark)
		set.remove(aposrophe)
		set.remove(greaterThanSign)
		set.remove(solidus)
		set.remove(equalsSign)

		return set
	}()
}
#endif
