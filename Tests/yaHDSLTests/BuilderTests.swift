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

}
