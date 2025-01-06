import Testing
import yaHDSL

struct MyDiv<Content: HTMLNode>: CustomHTMLNode {

	@HTMLContainerNodeBuilder
	let content: @Sendable () -> Content

	var node: some HTMLNode {
		Div {
			content()
			P("foo")
		}
		.setID("bar")
		.addClass("bling")
	}
}

struct CustomHTMLNodeTests {
	@Test func render() async throws {
		let test = MyDiv {
			A("bloop", href: "/blarp")
		}

		let out = try test.render(withContext: .default)

		let expectation = """
			<div class="bling" id="bar">\
			<a href="/blarp">bloop</a>\
			<p>foo</p>\
			</div>
			"""

		#expect(out == expectation)
	}

	@Test func tag() async throws {
		let test = MyDiv {
			A("bloop", href: "/blarp")
		}

		#expect(test.tag == "div")
	}
}
