#if canImport(Foundation)
import Foundation
#endif

public enum AttributeValue: Sendable {
	case string(String)
	case list([String])
	case int(Int)
	case float(Double)
	case flag

	func renderAttribute(named name: String) -> String {
		switch self {
		case .string(let string):
			"\(name)=\"\(Self.sanitizeValueString(string))\""
		case .list(let array):
			"\(name)=\"\(Self.sanitizeValueString(array.joined(separator: " ")))\""
		case .int(let int):
			"\(name)=\"\(int)\""
		case .float(let double):
			"\(name)=\"\(double)\""
		case .flag:
			"\(name)"
		}
	}

	private static func sanitizeValueString(_ string: String) -> String {
		#if canImport(Foundation)
		string.reduce(into: "") { outString, character in
			guard
				character.unicodeScalars.allSatisfy({ CharacterMapper.attributeValueAllowedCharacters.contains($0) })
			else {
				outString += CharacterMapper.preferName(for: character)
				return
			}
			outString.append(character)
		}
		#else
		string
		#endif
	}
}

#if canImport(Foundation)
public extension AttributeValue {
	static func b64Data(_ data: any DataProtocol, options: Data.Base64EncodingOptions) -> AttributeValue {
		let string = Data(data).base64EncodedString(options: options)
		return .string(string)
	}
}
#endif
