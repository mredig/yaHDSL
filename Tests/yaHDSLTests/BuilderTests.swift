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

	@Test("ConditionalNoElse", arguments: [true, false]) func testConditional(_ flag: Bool) throws {
		let div = Div {
			if flag {
				P("Foo")
			}
			P("base")
		}

		let trueExpectation = #"<div><p>Foo</p><p>base</p></div>"#
		let falseExpectation = #"<div><p>base</p></div>"#

		let render = try simpleRender(div)
		if flag {
			#expect(trueExpectation == render)
		} else {
			#expect(falseExpectation == render)
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

	@Test("someNode", arguments: [true, false]) func someHTMLNode(flag: Bool) async throws {
		@HTMLContainerNodeBuilder
		func test(flag: Bool) -> some HTMLNode {
			if flag {
				Div {
					H1("ahh")
				}
			} else {
				Empty()
			}
		}
		
		let render = try simpleRender(test(flag: flag))
		
		let expectation = {
			guard flag else {
				return ""
			}
			return #"<div><h1>ahh</h1></div>"#
		}()
		
		#expect(expectation == render)
	}

	@Test func group() async throws {
		let foo = Body {
			Group {
				A("bloop", href: "/blarp")

				P("foop")

				Br()
			}
		}

		let rendered = try foo.render(withContext: .default)

		let expectation = """
			<body>\
			<a href="/blarp">bloop</a>\
			<p>foop</p>\
			<br>\
			</body>
			"""

		#expect(rendered == expectation)
	}
}
