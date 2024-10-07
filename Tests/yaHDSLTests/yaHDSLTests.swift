import Testing
import yaHDSL

@Test func basicHTMLMinPage() async throws {
	let html = HTML(
		childNodes: [
			Head(childNodes: []),
			Body(childNodes: [
				Div(childNodes: [
					"Foo",
					"Bar",
				])
			]),
		])
	let doc = yaHTMLDocument(html: html, context: .default)

	print(try doc.render())
}

@Test func basicHTMLPrettyPage() async throws {
	let html = HTML(
		childNodes: [
			Head(childNodes: []),
			Body(childNodes: [
				Div(childNodes: [
					"Foo",
					"Bar",
				])
			]),
		])
	let doc = yaHTMLDocument(html: html, context: .defaultPretty)

	print(try doc.render())
}


@Test func basicHTMLBuilder() async throws {
	let yes = true
	let no = false

	let optYes: String? = "optYes"
	let optNo: String? = nil

	let html = HTML {
		Head {
			"foooooo"
		}
		Body {
			Div {
				if yes {
					"yar"
				}
				if let optYes {
					optYes
				}
				if let optNo {
					optNo
				}

				Div {
					if yes {
						"ifyes"
					} else {
						"ifyes bad"
					}

					if no {
						"ifno bad"
					} else {
						"ifno"
					}
				}
				"Foo"
				"bar"
			}
		}
	}

	let doc = yaHTMLDocument(html: html, context: .defaultPretty)

	let expectation = """
		<DOCTYPE html>
		<html>
			<head>
		foooooo
			</head>
			<body>
				<div>
		yar optYes
					<div>
		ifyes ifno
					</div>
		Foo bar
				</div>
			</body>
		</html>
		"""
	let render = try doc.render()
	print(render)
	#expect(expectation == render)
}
