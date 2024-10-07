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

	@Test func caption() async throws {
		let tag = Caption {
			"Photo by: barfoo"
		}

		let expected = "<caption>Photo by: barfoo</caption>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func cite() async throws {
		let tag = Cite {
			"Photo by: barfoo"
		}

		let expected = "<cite>Photo by: barfoo</cite>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func code() async throws {
		let tag = Span {
			"Run"
			Code { "method()" }
			"or die trying."
		}

		let expected = "<span>Run<code>method()</code>or die trying.</span>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func col() async throws {
		let tag = Col()
			.withSpan(3)

		let expected = "<col span=\"3\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func colgroup() async throws {
		let tag = Colgroup {
			Col()
				.withSpan(3)
		}

		let expected = "<colgroup><col span=\"3\"></colgroup>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func data() async throws {
		let tag = HtmlData {
			"lettuce"
		}
			.withValue(1.23)

		let expected = "<data value=\"1.23\">lettuce</data>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func datalist() async throws {
		let tag = Datalist {
			Option { "A" }
				.withValue("AA")
			Option { "B" }
				.withValue("BB")
		}
			.setID("thelist")

		let expected = "<datalist id=\"thelist\"><option value=\"AA\">A</option><option value=\"BB\">B</option></datalist>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func dd() async throws {
		let tag = Dd {
			"boo far"
		}

		let expected = "<dd>boo far</dd>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func del() async throws {
		let tag = P {
			Del {
				"BELETED"
			}
			"it's dot com"
		}

		let expected = "<p><del>BELETED</del>it's dot com</p>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func details() async throws {
		try simpleContainer(tagName: "details", Details.self)
	}

	@Test func dfn() async throws {
		try simpleContainer(tagName: "dfn", Dfn.self)
	}

	@Test func dialog() async throws {
		try simpleContainer(tagName: "dialog", Dialog.self)
	}

	@Test func div() async throws {
		let tag = Div(id: "bob") {
			"burger"
		}

		let expected = "<div id=\"bob\">burger</div>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func dl() async throws {
		try simpleContainer(tagName: "dl", Dl.self)
	}

	@Test func dt() async throws {
		try simpleContainer(tagName: "dt", Dt.self)
	}

	@Test func em() async throws {
		try simpleContainer(tagName: "em", Em.self)
	}

	@Test func embed() async throws {
		let tag = Embed()
			.withWidth(200)
			.withHeight(100)
			.withSrc("/barf/foob")

		let expected = "<embed height=\"100\" src=\"/barf/foob\" width=\"200\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}
}

extension HTMLTagTests {
	func simpleContainer<Tag: HTMLContentElement>(tagName: String, _ divLikeTag: Tag.Type) throws {
		let tag = Tag {
			"the content"
		}

		let expected = "<\(tagName)>the content</\(tagName)>"
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
