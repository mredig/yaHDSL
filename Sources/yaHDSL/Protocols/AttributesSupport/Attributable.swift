public protocol Attributable: Sendable {
	var attributes: [AttributeName: AttributeValue] { get set }
	var attributesOptions: AttributesOptions? { get set }

	func setAttribute(named name: String, value: AttributeValue) throws(AttributeName.Error) -> Self
	func setAttribute(named name: AttributeName, value: AttributeValue) -> Self
	func removeAttribute(named name: AttributeName) -> Self

	func renderAttributes() -> String
}

public extension Attributable {
	nonisolated(unsafe) static var defaultAttributesOptions: AttributesOptions { .init() }

	func setAttribute(named name: String, value: AttributeValue) throws(AttributeName.Error) -> Self {
		let name = try AttributeName(name)
		return setAttribute(named: name, value: value)
	}

	func setAttribute(named name: AttributeName, value: AttributeValue) -> Self {
		var new = self
		new.attributes[name] = value
		return new
	}

	func removeAttribute(named name: AttributeName) -> Self {
		var new = self
		new.attributes[name] = nil
		return new
	}

	func setAttribute<T: RawRepresentable>(named name: AttributeName, value: T) -> Self where T.RawValue == String {
		setAttribute(named: name, value: value.rawValue)
	}

	func setAttribute(named name: AttributeName, value: String) -> Self {
		setAttribute(named: name, value: .string(value))
	}

	func setAttribute(named name: AttributeName, values: String...) -> Self {
		setAttribute(named: name, value: .list(values))
	}

	func setAttribute(named name: AttributeName, value: any BinaryInteger) -> Self {
		setAttribute(named: name, value: .int(Int(value)))
	}

	func setAttribute(named name: AttributeName, value: any BinaryFloatingPoint) -> Self {
		setAttribute(named: name, value: .float(Double(value)))
	}

	func setAttributeFlag(named name: AttributeName) -> Self {
		var new = self
		new.attributes[name] = .flag
		return new
	}

	func renderAttributes() -> String {
		let options = attributesOptions ?? Self.defaultAttributesOptions
		let accumulator: [String] = attributes.reduce(into: []) { accum, element in
			let name = element.key.rawValue
			let value = element.value
			accum.append(value.renderAttribute(named: name, preferNamedCharacterReferences: options.preferNamedCharacterReferences))
		}
		let accumulated = {
			if options.sortAttributes {
				accumulator.sorted()
			} else {
				accumulator
			}
		}()
		return accumulated.joined(separator: " ")
	}
}

