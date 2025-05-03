import yaHDSL

public protocol HTMLPageGenerator {
	var head: any yaHDSL.HeadProtocol { get throws }
	var body: any yaHDSL.BodyProtocol { get throws }

	var aggregate: any yaHDSL.HTMLProtocol { get throws }
}

public extension HTMLPageGenerator {
	var aggregate: any yaHDSL.HTMLProtocol {
		get throws {
			try HTML {
				try head
				try body
			}
		}
	}

	func render() throws -> String {
		try yaHTMLDocument(html: try aggregate, context: .default).render()
	}
}
