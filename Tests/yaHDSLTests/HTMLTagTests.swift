import Testing
import Foundation
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

	@Test func area() async throws {
		let tag = Area(attributes: [:])
			.withShape(.circle)
			.withCoords([24, 534, 234])
			.withAlt("Sample")
			.withHref("/foo")

		let expected = "<area alt=\"Sample\" coords=\"24,534,234\" href=\"/foo\" shape=\"circle\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func article() async throws {
		let tag = Article {
			H3 { "Foo" }
			P { "baz bar boof" }
		}

		let expected = "<article><h3>Foo</h3><p>baz bar boof</p></article>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func aside() async throws {
		let tag = Aside {
			H3 { "Foo" }
			P { "baz bar boof" }
		}

		let expected = "<aside><h3>Foo</h3><p>baz bar boof</p></aside>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func audio() async throws {
		let tag = Audio {
			Source()
				.withSrc(URL(string: "https://youtube.com/notsong.mp3")!)
				.withType("audio/ogg")
			"Your browser sucks"
		}
			.withControls(true)
			.withMuted(true)

		let expected = "<audio controls muted><source src=\"https://youtube.com/notsong.mp3\" type=\"audio/ogg\">Your browser sucks</audio>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func b() async throws {
		let tag = P {
			"foo"
			B { "bar" }
		}

		let expected = "<p>foo<b>bar</b></p>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func base() async throws {
		let tag = Head {
			Base()
				.withHref(URL(string: "https://foo.bar")!)
				.withTarget(.blank)
		}

		let expected = "<head><base href=\"https://foo.bar\" target=\"_blank\"></head>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func bdi() async throws {
		let tag = Span {
			"User: "
			Bdi { "foo" }
			"Password: "
			Bdi { "bar" }
		}

		let expected = "<span>User: <bdi>foo</bdi>Password: <bdi>bar</bdi></span>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func bdo() async throws {
		let tag = Bdo(dir: .ltr) {
			"blue blar"
		}

		let expected = "<bdo dir=\"ltr\">blue blar</bdo>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func blockquote() async throws {
		let tag = Blockquote {
			"foo"
			"bar"
			"baz"
		}
			.withCitation("https://bar.foo/article")

		let expected = "<blockquote cite=\"https://bar.foo/article\">foo bar baz</blockquote>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func button() async throws {
		let tag = Button {
			"Press Me"
		}
			.withForm("theForm")
			.withName("buttoo")
			.withFormMethod(.post)

		let expected = "<button form=\"theForm\" formmethod=\"post\" name=\"buttoo\">Press Me</button>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func canvas() async throws {
		let tag = Canvas {
			Button {
				"Clear it"
			}
		}
			.withWidth(100)
			.withHeight(50)

		let expected = "<canvas height=\"50\" width=\"100\"><button>Clear it</button></canvas>"
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
