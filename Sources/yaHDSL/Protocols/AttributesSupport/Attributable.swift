public protocol Attributable: Sendable {
	var attributes: [String: AttributeValue] { get set }

	func setAttribute(named name: String, value: AttributeValue) -> Self
	func removeAttribute(named name: String) -> Self

	func renderAttributes() -> String
}

public extension Attributable {
	func setAttribute(named name: String, value: AttributeValue) -> Self {
		var new = self
		new.attributes[name] = value
		return new
	}

	func removeAttribute(named name: String) -> Self {
		var new = self
		new.attributes[name] = nil
		return new
	}

	func setAttribute(named name: String, value: String) -> Self {
		setAttribute(named: name, value: .string(value))
	}

	func setAttribute(named name: String, values: String...) -> Self {
		setAttribute(named: name, value: .list(values))
	}

	func setAttribute(named name: String, value: any BinaryInteger) -> Self {
		setAttribute(named: name, value: .int(Int(value)))
	}

	func setAttribute(named name: String, value: any BinaryFloatingPoint) -> Self {
		setAttribute(named: name, value: .float(Double(value)))
	}

	func setAttributeFlag(named name: String) -> Self {
		var new = self
		new.attributes[name] = .flag
		return new
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
