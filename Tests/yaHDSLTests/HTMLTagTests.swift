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

	@Test func fieldset() async throws {
		let tag = Fieldset {
			Legend { "title" }
			Div {
				Label(forInputID: "name", content: "name")
				Input(inputType: .text, nameAndID: "name")
					.withPlaceholder("Bob Doe")
			}
		}
			.withDisabled(true)

		let expected = """
			<fieldset disabled>\
			<legend>title</legend>\
			<div>\
			<label for="name">name</label>\
			<input id="name" name="name" placeholder="Bob Doe" type="text">\
			</div>\
			</fieldset>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func figcaption() async throws {
		try simpleContainer(tagName: "figcaption", Figcaption.self)
	}

	@Test func figure() async throws {
		try simpleContainer(tagName: "figure", Figure.self)
	}

	@Test func footer() async throws {
		try simpleContainer(tagName: "footer", Footer.self)
	}

	@Test func form() async throws {
		let tag = Form(method: .post, action: "/api/v1/create", encodeType: .multipartFormData) {
			Label(forInputID: "firstname", content: "First Name: ")
			Input(inputType: .text, nameAndID: "firstname")
			Label(forInputID: "lastname", content: "Last Name: ")
			Input(inputType: .text, name: "lastname", id: "asdf")
		}

		let expected = """
			<form action="/api/v1/create" enctype="multipart/form-data" method="post">\
			<label for="firstname">First Name: </label>\
			<input id="firstname" name="firstname" type="text">\
			<label for="lastname">Last Name: </label>\
			<input id="asdf" name="lastname" type="text">\
			</form>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func h123456() async throws {
		let div = Div {
			H1("one")
			H2("two")
			H3("three")
			H4("four")
			H5("five")
			H6("six")
		}

		let expected = """
			<div>\
			<h1>one</h1>\
			<h2>two</h2>\
			<h3>three</h3>\
			<h4>four</h4>\
			<h5>five</h5>\
			<h6>six</h6>\
			</div>
			"""
		let render = try simpleRender(div)
		#expect(expected == render)
	}

	@Test func head() async throws {
		let tag = Head(title: "yaHDSL")

		let expected = "<head><title>yaHDSL</title></head>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func header() async throws {
		try simpleContainer(tagName: "header", Header.self)
	}

	@Test func hgroup() async throws {
		try simpleContainer(tagName: "hgroup", Hgroup.self)
	}

	@Test func hr() async throws {
		let tag = Hr()

		let expected = "<hr>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func i() async throws {
		try simpleContainer(tagName: "i", I.self)
	}

	@Test func iframe() async throws {
		let tag = Div {
			Iframe(src: URL(string: "https://redeggproductions.com")!)
				.withName("home")
				.withLoading(.eager)
				.withSandbox([.allowScripts])
		}

		let expected = """
			<div>\
			<iframe loading="eager" name="home" sandbox="allow-scripts" src="https://redeggproductions.com">\
			</iframe>\
			</div>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)

		let prettyExpected = """
			<div>
				<iframe loading="eager" name="home" sandbox="allow-scripts" src="https://redeggproductions.com">
				</iframe>
			</div>
			"""
		let prettyRender = try simpleRender(tag, mode: .pretty(indentation: "\t"))
		#expect(prettyExpected == prettyRender)
	}

	@Test func img() async throws {
		let tag = Img(src: "/foo/bar", alt: "fubar")

		let expected = "<img alt=\"fubar\" src=\"/foo/bar\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func input() async throws {
		let tag = Form {
			Input(inputType: .text, nameAndID: "firstname")
			Input(inputType: .text, nameAndID: "lastname")
			Input(inputType: .tel, nameAndID: "number")
		}

		let expected = """
			<form>\
			<input id="firstname" name="firstname" type="text">\
			<input id="lastname" name="lastname" type="text">\
			<input id="number" name="number" type="tel">\
			</form>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func ins() async throws {
		try simpleContainer(tagName: "ins", Ins.self)
	}

	@Test func kbd() async throws {
		try simpleContainer(tagName: "kbd", Kbd.self)
	}

	@Test func label() async throws {
		let tagA = Label(forInputID: "firstName", content: "First Name")
		let tagB = Label(forInputID: "firstName") {
			"First Name"
		}

		let expected = "<label for=\"firstName\">First Name</label>"
		let renderA = try simpleRender(tagA)
		#expect(expected == renderA)

		let renderB = try simpleRender(tagB)
		#expect(expected == renderB)
	}

	@Test func li() async throws {
		let tag = Ul {
			Li { "foo" }.withValue(0)
			Li { "bar" }.withValue(1)
		}

		let expected = "<ul><li value=\"0\">foo</li><li value=\"1\">bar</li></ul>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func legend() async throws {
		try simpleContainer(tagName: "legend", Legend.self)
	}

	@Test func link() async throws {
		let styles = Link(href: "/assets/css/styles.css")
			.withRel(.Link.stylesheet)

		let icon = Link(href: "/images/favicon.ico", rel: .Link.icon)

		let sylesExpected = "<link href=\"/assets/css/styles.css\" rel=\"stylesheet\">"
		let stylesRender = try simpleRender(styles)
		#expect(sylesExpected == stylesRender)

		let iconExpected = "<link href=\"/images/favicon.ico\" rel=\"icon\">"
		let iconRender = try simpleRender(icon)
		#expect(iconExpected == iconRender)
	}

	@Test func main() async throws {
		try simpleContainer(tagName: "main", Main.self)
	}

	@Test func map() async throws {
		try simpleContainer(tagName: "map", Map.self)
	}

	@Test func mark() async throws {
		try simpleContainer(tagName: "mark", Mark.self)
	}

	@Test func menu() async throws {
		try simpleContainer(tagName: "menu", Menu.self)
	}

	@Test func meta() async throws {
		let tag = Meta()
			.withCharset("utf-8")

		let expected = "<meta charset=\"utf-8\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func meta2() async throws {
		let tag = Meta()
			.withHttpEquiv(.refresh)
			.withContent("15;url=https://foo.bar")

		let expected = "<meta content=\"15;url=https://foo.bar\" http-equiv=\"refresh\">"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func meter() async throws {
		let tag = Meter {
			"80%"
		}
			.withValue(80)
			.withMax(100)
			.withMin(0)

		let expected = "<meter max=\"100\" min=\"0\" value=\"80\">80%</meter>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func nav() async throws {
		try simpleContainer(tagName: "nav", Nav.self)
	}

	@Test func noscript() async throws {
		try simpleContainer(tagName: "noscript", NoScript.self)
	}

	@Test func object() async throws {
		let tag = Object()
			.withData("/foo/bar.jpg")
			.withType("image/jpeg")

		let expected = "<object data=\"/foo/bar.jpg\" type=\"image/jpeg\"></object>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func ol() async throws {
		let tag = Ol {
			Li { "foo" }
			Li { "bar" }
			Li { "baz" }
		}
			.withType(.lowercaseRomanNumerals)
			.withStart(3)


		let expected = "<ol start=\"3\" type=\"i\"><li>foo</li><li>bar</li><li>baz</li></ol>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func optgroupAndOption() async throws {
		let tag = OptGroup {
			Option { "foo" }
			Option { "bar" }
		}
			.withLabel("placeholders")


		let expected = "<optgroup label=\"placeholders\"><option>foo</option><option>bar</option></optgroup>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func output() async throws {
		let tag = Output {
			"325"
		}
			.withFor(["addend1", "addend2"])
			.withName("total")

		let expected = "<output for=\"addend1 addend2\" name=\"total\">325</output>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func p() async throws {
		try simpleContainer(tagName: "p", P.self)
	}

	@Test func picture() async throws {
		try simpleContainer(tagName: "picture", Picture.self)
	}

	@Test func pre() async throws {
		try simpleContainer(tagName: "pre", Pre.self)
	}

	@Test func progress() async throws {
		let tag = yaHDSL.Progress {
			"update"
		}
			.withMax(123)
			.withValue(66)

		let expected = "<progress max=\"123.0\" value=\"66.0\">update</progress>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func q() async throws {
		let tag = P {
			"foo"
			Q { "did" }.withCitation("/baz")
			"bar"
		}

		let expected = "<p>foo<q cite=\"/baz\">did</q>bar</p>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func rp() async throws {
		let tag = Rp("asdf")

		let expected = #"<rp>asdf</rp>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func rt() async throws {
		try simpleContainer(tagName: "rt", Rt.self)
	}

	@Test func ruby() async throws {
		try simpleContainer(tagName: "ruby", Ruby.self)
	}

	@Test func s() async throws {
		try simpleContainer(tagName: "s", S.self)
	}

	@Test func samp() async throws {
		try simpleContainer(tagName: "samp", Samp.self)
	}

	@Test func script() async throws {
		let tag = Script(src: "/assets/js/foo.js")

		let expected = #"<script src="/assets/js/foo.js"></script>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func script2() async throws {
		let tag = Script(#"console.log("hello world")"#)

		let expected = #"<script>console.log("hello world")</script>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func search() async throws {
		try simpleContainer(tagName: "search", Search.self)
	}

	@Test func section() async throws {
		try simpleContainer(tagName: "section", Section.self)
	}

	@Test func select() async throws {
		let tag = Select {
			Option { "A" }.withValue("a")
			Option { "B" }.withValue("b").withSelected(true)
		}
			.withName("alpha")
			.withMultiple(true)

		let expected = """
			<select multiple name="alpha">\
			<option value="a">A</option>\
			<option selected value="b">B</option>\
			</select>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func slot() async throws {
		let tag = Slot {
			"content"
		}.withName("foo")

		let expected = #"<slot name="foo">content</slot>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func small() async throws {
		try simpleContainer(tagName: "small", Small.self)
	}

	@Test func span() async throws {
		try simpleContainer(tagName: "span", Span.self)
	}

	@Test func strong() async throws {
		try simpleContainer(tagName: "strong", Strong.self)
	}

	@Test func style() async throws {
		let tag = Style("a { color: red; }")
			.setTitleAttribute("Normal")

		let expected = #"<style title="Normal">a { color: red; }</style>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func sub() async throws {
		try simpleContainer(tagName: "sub", Sub.self)
	}

	@Test func summary() async throws {
		try simpleContainer(tagName: "summary", Summary.self)
	}

	@Test func sup() async throws {
		try simpleContainer(tagName: "sup", Sup.self)
	}

	@Test func svg() async throws {
		let svgCode = """
			<rect x='0' y='0' width='50%' height='50%' fill='tomato' opacity='0.75' />
			<rect x='25%' y='25%' width='50%' height='50%' fill='slategrey' opacity='0.75' />
			<rect x='50%' y='50%' width='50%' height='50%' fill='olive' opacity='0.75' />
			<rect x='0' y='0' width='100%' height='100%' stroke='cadetblue' stroke-width='0.5%' fill='none' />
			"""

		let tag = Svg(svgCode)
			.withPreserveAspectRatio(Svg.AspectRatioMode(xyMode: .xMaxYMax, meetSliceMode: .slice))

		let expected = """
			<svg preserveaspectratio="xMaxYMax slice">\(svgCode)</svg>
			"""
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func table() async throws {
		let tag = Table {
			Tr {
				Td {
					"fpp"
				}
			}
		}

		let expected = #"<table><tr><td>fpp</td></tr></table>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func tbody() async throws {
		let tag = TBody {
			Tr {
				Td {
					"fpp"
				}
			}
		}

		let expected = #"<tbody><tr><td>fpp</td></tr></tbody>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func td() async throws {
		let tag = Td {
			"foo"
		}
			.withColSpan(2)
			.withRowSpan(3)

		let expected = #"<td colspan="2" rowspan="3">foo</td>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func template() async throws {
		try simpleContainer(tagName: "template", Template.self)
	}

	@Test func textarea() async throws {
		let tag = Textarea("foo blar")
			.withWrap(.hard)
			.withRows(15)

		let expected = #"<textarea rows="15" wrap="hard">foo blar</textarea>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func tfoot() async throws {
		try simpleContainer(tagName: "tfoot", TFoot.self)
	}

	@Test func th() async throws {
		let tag = Th {
			"flooo blarrr"
		}
			.withAbbr("baz")
			.withScope(.col)

		let expected = #"<th abbr="baz" scope="col">flooo blarrr</th>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func thead() async throws {
		try simpleContainer(tagName: "thead", THead.self)
	}

	@Test func time() async throws {
		let date = DateComponents(
			calendar: .autoupdatingCurrent,
			timeZone: .gmt,
			year: 2024,
			month: 10,
			day: 8,
			hour: 16,
			minute: 32,
			second: 15)
			.date!

		let tag = Time(timestamp: date)

		let expected = #"<time datetime="2024-10-08T16:32:15Z">2024-10-08T16:32:15Z</time>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func time2() async throws {
		let date = DateComponents(
			calendar: .autoupdatingCurrent,
			timeZone: .gmt,
			year: 2024,
			month: 10,
			day: 8,
			hour: 16,
			minute: 32,
			second: 15)
			.date!

		let formatter = DateFormatter()
		formatter.timeZone = .gmt
		formatter.dateStyle = .short
		formatter.timeStyle = .short
		formatter.formattingContext = .standalone
		let tag = Time(timestamp: date, formatter: formatter)

		let expected = #"<time datetime="2024-10-08T16:32:15Z">10/8/24, 4:32 PM</time>"# // contains U+0x202f - nbsp
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func title() async throws {
		let tag = Title("Great Scott")

		let expected = "<title>Great Scott</title>"
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func tr() async throws {
		let tag = Tr {
			Th { "head" }
			Td { "box" }
		}

		let expected = #"<tr><th>head</th><td>box</td></tr>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func track() async throws {
		let tag = Track()
			.withDefault(true)
			.withSrcLang("en")
			.withSrc("/video/foo.vtt")

		let expected = #"<track default src="/video/foo.vtt" srclang="en">"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func u() async throws {
		try simpleContainer(tagName: "u", U.self)
	}

	@Test func ul() async throws {
		try simpleContainer(tagName: "ul", Ul.self)
	}

	@Test func `var`() async throws {
		try simpleContainer(tagName: "var", Var.self)
	}

	@Test func video() async throws {
		let tag = Video {
			Source().withSrc("/video/foo.mov")
			Track().withKind(.captions).withSrc("/video/foo.vtt")
		}
			.withControls(true)

		let expected = #"<video controls><source src="/video/foo.mov"><track kind="captions" src="/video/foo.vtt"></video>"#
		let render = try simpleRender(tag)
		#expect(expected == render)
	}

	@Test func wbr() async throws {
		let tag = Span {
			"first"
			Wbr()
			"second"
		}

		let expected = #"<span>first<wbr>second</span>"#
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
	private func simpleRender<Component: HTMLNode>(
		_ component: Component,
		mode: yaHTMLDocument.Context.Mode = .minify
	) throws -> String {
		let context = yaHTMLDocument.Context(mode: mode, userInfo: [:])
		return try component.render(withContext: context).yaNS.with {
			print($0)
		}
	}
}
