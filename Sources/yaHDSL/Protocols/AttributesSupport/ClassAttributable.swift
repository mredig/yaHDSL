public protocol ClassAttributable: Attributable {
	func addClass(_ class: String) -> Self
	func addClasses(_ classes: [String]) -> Self
	func setClass(_ class: String) -> Self
	func setClasses(_ classes: [String]) -> Self
	func removeClass(_ class: String) -> Self
	func removeClasses(_ classes: [String]) -> Self
}

public extension ClassAttributable {
	func addClasses(_ newClasses: [String]) -> Self {
		var classList: [String]
		if let existing = attributes[.class], case .list(let contents) = existing {
			classList = contents
		} else {
			classList = []
		}
		classList.append(contentsOf: newClasses)
		return setAttribute(named: .class, value: .list(classList))
	}

	func addClass(_ class: String) -> Self {
		return addClasses([`class`])
	}

	func setClasses(_ newClasses: [String]) -> Self {
		return setAttribute(named: .class, value: .list(newClasses))
	}

	func setClass(_ class: String) -> Self {
		return setClasses([`class`])
	}

	func removeClasses(_ removedClasses: [String]) -> Self {
		guard
			let existing = attributes[.class], case .list(var classList) = existing
		else { return self }
		for removedClass in removedClasses {
			classList.removeAll(where: { $0 == removedClass })
		}
		return setAttribute(named: .class, value: .list(classList))
	}

	func removeClass(_ class: String) -> Self {
		return removeClasses([`class`])
	}
}
