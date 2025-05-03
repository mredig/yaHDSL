import yaHDSL
import yaHDSL_Utilities
import Testing

struct PageGenTest {

	struct HomePage: HTMLPageGenerator {
		let pageTitle: String

		let header: String

		var head: any yaHDSL.HeadProtocol {
			Head(title: pageTitle) {
				Meta(attributes: [.autofocus: .bool(true)])
			}
		}

		var body: any yaHDSL.BodyProtocol {
			Body {
				Main {
					Header {
						H1(header)

						H3("BLar")
					}

					Div {
						"aslkdfjalsk"
					}
				}
			}
		}
	}


	@Test func generate() async throws {
		let test = HomePage(pageTitle: "Home Page", header: "Floo")

		let output = try test.render()

		let expectation = """
			<!DOCTYPE html>
			<html><head><meta autofocus="true"><title>Home Page</title></head>\
			<body><main><header><h1>Floo</h1><h3>BLar</h3></header><div>aslkdfjalsk</div>\
			</main></body></html>
			"""

		#expect(expectation == output)
	}
}
