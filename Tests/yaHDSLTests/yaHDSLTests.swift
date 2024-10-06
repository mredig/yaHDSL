import Testing
import yaHDSL

@Test func basicHTMLMinPage() async throws {
	let html = HTML(childNodes: [])
	let doc = yaHTMLDocument(html: html, context: .default)

	print(try doc.render())
}

@Test func basicHTMLPrettyPage() async throws {
	let html = HTML(childNodes: [])
	let doc = yaHTMLDocument(html: html, context: .defaultPretty)

	print(try doc.render())
}

