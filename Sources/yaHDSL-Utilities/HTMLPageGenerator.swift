import yaHDSL

public protocol HTMLPageGenerator {
	var pageTitle: String? { get }
	var head: any yaHDSL.HeadProtocol { get throws }
	var body: any yaHDSL.BodyProtocol { get throws }

	var aggregate: HTML { get throws }
}

public extension HTMLPageGenerator {
	@HTMLContainerNodeBuilder
	var aggregate: HTML {
		get throws {
			try head

			try body
		}
	}

	func render() throws -> String {
		try yaHTMLDocument(html: try aggregate, context: .default).render()
	}
}
