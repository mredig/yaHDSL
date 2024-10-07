public protocol IDAttributable: Attributable {
	func setID(_ id: String) -> Self
}

public extension IDAttributable {
	func setID(_ id: String) -> Self {
		var new = self
		new.attributes["id"] = .string(id)
		return new
	}
}
