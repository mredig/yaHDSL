#if canImport(Foundation)
import Foundation
#endif

public struct AttributeValue: Sendable {
	public let requireOutput: Bool
	public let payload: Payload

	public init(_ payload: Payload, requireOutput: Bool = false) {
		self.requireOutput = requireOutput
		self.payload = payload
	}

	public static func string(_ string: String, requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.string(string), requireOutput: requireOutput)
	}

	public static func list(_ list: [String], requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.list(list), requireOutput: requireOutput)
	}

	public static func int(_ int: Int, requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.int(int), requireOutput: requireOutput)
	}

	public static func float(_ float: Double, requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.float(float), requireOutput: requireOutput)
	}

	public static func bool(_ bool: Bool, requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.bool(bool), requireOutput: requireOutput)
	}

	public static func flag(requireOutput: Bool = false) -> AttributeValue {
		AttributeValue(.flag, requireOutput: requireOutput)
	}

	func renderAttribute(named name: String, options: AttributesOptions) -> String? {
		let renderedValue: String
		switch payload {
		case .string(let string):
			renderedValue = AttributeValue.sanitizeValueString(string, preferNamedCharacterReferences: options.preferNamedCharacterReferences)
		case .list(let array):
			renderedValue = AttributeValue.sanitizeValueString(array.joined(separator: " "), preferNamedCharacterReferences: options.preferNamedCharacterReferences)
		case .int(let int):
			renderedValue = "\(int)"
		case .float(let double):
			renderedValue = "\(double)"
		case .bool(let bool):
			renderedValue = "\(bool)"
		case .flag:
			return "\(name)"
		}

		guard renderedValue.isEmpty == false || options.nullifyEmptyAttributes == false || requireOutput else {
			return nil
		}
		return "\(name)=\"\(renderedValue)\""
	}

	private static func sanitizeValueString(_ string: String, preferNamedCharacterReferences: Bool) -> String {
		#if canImport(Foundation)
		string.reduce(into: "") { outString, character in
			guard
				character.unicodeScalars.allSatisfy({ CharacterMapper.attributeValueAllowedCharacters.contains($0) })
			else {
				if preferNamedCharacterReferences {
					outString += CharacterMapper.preferName(for: character)
				} else {
					outString += CharacterMapper.getCode(for: character)
				}
				return
			}
			outString.append(character)
		}
		#else
		string
		#endif
	}

	public enum Payload: Sendable {
		case string(String)
		case list([String])
		case int(Int)
		case float(Double)
		case bool(Bool)
		case flag
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
