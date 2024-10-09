import Testing
import Foundation
import yaHDSL

struct BuilderTests: SimpleTestRendering {
	@Test("OptionalElse", arguments: ["Foo", nil]) func testOptionalsElse(arg: String?) async throws {
		let div = Div {
			if let arg {
				P(arg)
			} else {
				Img(src: "/missing.jpg", alt: "no mas")
			}
		}

		let someExpectation = #"<div><p>Foo</p></div>"#
		let noneExpectation = #"<div><img alt="no mas" src="/missing.jpg"></div>"#

		let render = try simpleRender(div)
		if arg != nil {
			#expect(someExpectation == render)
		} else {
			#expect(noneExpectation == render)
		}
	}

	@Test("OptionalBase", arguments: ["Foo", nil]) func testOptionalsBase(arg: String?) async throws {
		let div = Div {
			if let arg {
				P(arg)
			}
			P("base")
		}

		let someExpectation = #"<div><p>Foo</p><p>base</p></div>"#
		let noneExpectation = #"<div><p>base</p></div>"#

		let render = try simpleRender(div)
		if arg != nil {
			#expect(someExpectation == render)
		} else {
			#expect(noneExpectation == render)
		}
	}

	@Test func testForLoop() throws {
		let list = Ul {
			for i in 0..<3 {
				Li { P("\(i)") }
			}
		}

		let expectation = """
			<ul>\
			<li><p>0</p></li>\
			<li><p>1</p></li>\
			<li><p>2</p></li>\
			</ul>
			"""
		let render = try simpleRender(list)

		#expect(expectation == render)
	}
}
