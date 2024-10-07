import Testing
import yaHDSL

struct HTMLTagTests {

	@Test func comment() throws {
		let comment = Comment(content: "This is a comment.")

		let render = try simpleRender(comment)

		let expectation = "<!-- This is a comment. -->"
		#expect(expectation == render)
	}

	@Test func a() async throws {
		let anchor = A {
			"Mah Link"
		}
		.withHref("/foo")
		.withPing([
			"www.google.com",
			"www.bing.com"
		])

		let expected = "<a href=\"/foo\" ping=\"www.google.com www.bing.com\">Mah Link</a>"

		let render = try simpleRender(anchor)
		#expect(expected == render)
	}

	@Test func abbr() async throws {
		let tag = Abbr {
			"FOMO"
		}
			.setTitleAttribute("Fear Of Missing Out")

		let expected = "<abbr title=\"Fear Of Missing Out\">FOMO</abbr>"

		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func address() async throws {
		let tag = Address {
			"Bob Loblaw"
			Br()
			"123 Law Bomb Dr"
			Br()
			"Orange County, CA 90210"
		}

		let expected = "<address>Bob Loblaw<br>123 Law Bomb Dr<br>Orange County, CA 90210</address>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}
}


extension HTMLTagTests {
	private func simpleRender<Component: HTMLNode>(_ component: Component) throws -> String {
		let context = yaHTMLDocument.Context(mode: .minify, userInfo: [:])
		return try component.render(withContext: context).with {
			print($0)
		}
	}
}
