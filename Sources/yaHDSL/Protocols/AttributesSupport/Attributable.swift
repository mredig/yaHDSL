public protocol Attributable: Sendable {
	var attributes: [String: AttributeValue] { get set }

	mutating func setAttribute(named name: String, value: AttributeValue)
	mutating func removeAttribute(named name: String)

	func renderAttributes() -> String
}

public extension Attributable {
	mutating func setAttribute(named name: String, value: AttributeValue) {
		attributes[name] = value
	}

	mutating func removeAttribute(named name: String) {
		attributes[name] = nil
	}

	mutating func setAttribute(named name: String, value: String) {
		setAttribute(named: name, value: .string(value))
	}

	mutating func setAttribute(named name: String, values: String...) {
		setAttribute(named: name, value: .list(values))
	}

	mutating func setAttribute(named name: String, value: any BinaryInteger) {
		setAttribute(named: name, value: .int(Int(value)))
	}

	mutating func setAttribute(named name: String, value: any BinaryFloatingPoint) {
		setAttribute(named: name, value: .float(Double(value)))
	}

	mutating func setAttributeFlag(named name: String) {
		attributes[name] = .flag
	}

	func renderAttributes() -> String {
		let accumulator: [String] = attributes.reduce(into: []) { accum, element in
			let name = element.key
			let value = element.value
			accum.append(value.renderAttribute(named: name))
		}
		return accumulator.joined(separator: " ")
	}
}
