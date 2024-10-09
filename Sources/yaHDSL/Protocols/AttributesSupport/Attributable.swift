public protocol Attributable: Sendable {
	var attributes: [AttributeName: AttributeValue] { get set }
	var attributesOptions: AttributesOptions? { get set }

	func setAttribute(named name: String, value: AttributeValue) throws(AttributeName.Error) -> Self
	func setAttribute(named name: AttributeName, value: AttributeValue) -> Self
	func removeAttribute(named name: AttributeName) -> Self

	func renderAttributes() -> String?
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

	func renderAttributes() -> String? {
		guard attributes.isEmpty == false else { return nil }
		let options = attributesOptions ?? Self.defaultAttributesOptions
		let accumulator: [String] = attributes.reduce(into: []) { accum, element in
			let name = element.key.rawValue
			let value = element.value
			guard let attribute = value.renderAttribute(named: name, options: options) else { return }
			accum.append(attribute)
		}
		let accumulated = {
			if options.sortAttributes {
				accumulator.sorted()
			} else {
				accumulator
			}
		}()
		let final = accumulated.joined(separator: " ")
		guard final.isEmpty == false else {
			return nil
		}
		return final
	}

	func customizingOptions(_ block: (inout AttributesOptions?) throws -> Void) rethrows -> Self {
		var options: AttributesOptions? = attributesOptions ?? Self.defaultAttributesOptions
		try block(&options)
		var new = self
		new.attributesOptions = options
		return new
	}
}

