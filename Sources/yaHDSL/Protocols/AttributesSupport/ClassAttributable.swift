public protocol ClassAttributable: Attributable {
	func addClass(_ class: ClassValue) -> Self
	func addClasses(_ classes: [ClassValue]) -> Self
	func setClass(_ class: ClassValue) -> Self
	func setClasses(_ classes: [ClassValue]) -> Self
	func removeClass(_ class: ClassValue) -> Self
	func removeClasses(_ classes: [ClassValue]) -> Self
}

public extension ClassAttributable {
	func addClasses(_ newClasses: ClassValue...) -> Self {
		addClasses(newClasses)
	}

	func addClasses(_ newClasses: [ClassValue]) -> Self {
		var classList: [ClassValue]
		if let existing = attributes[.class], case .list(let contents) = existing {
			classList = contents.map(ClassValue.init(rawValue:))
		} else {
			classList = []
		}
		classList.append(contentsOf: newClasses)
		return setAttribute(named: .class, value: .list(classList.map(\.rawValue)))
	}

	func addClass(_ class: ClassValue) -> Self {
		addClasses([`class`])
	}

	func addClass(_ class: String) -> Self {
		addClass("\(`class`)" as ClassValue)
	}

	func setClasses(_ newClasses: [ClassValue]) -> Self {
		setAttribute(named: .class, value: .list(newClasses.map(\.rawValue)))
	}

	func setClass(_ class: ClassValue) -> Self {
		setClasses([`class`])
	}

	func setClass(_ class: String) -> Self {
		setClass("\(`class`)" as ClassValue)
	}

	func removeClasses(_ removedClasses: [ClassValue]) -> Self {
		guard
			let existing = attributes[.class], case .list(var classList) = existing
		else { return self }
		for removedClass in removedClasses {
			classList.removeAll(where: { $0 == removedClass.rawValue })
		}
		return setAttribute(named: .class, value: .list(classList))
	}

	func removeClass(_ class: ClassValue) -> Self {
		removeClasses([`class`])
	}

	func removeClass(_ class: String) -> Self {
		removeClass("\(`class`)" as ClassValue)
	}
}
