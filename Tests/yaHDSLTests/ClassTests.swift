import Testing
import Foundation
import yaHDSL

struct ClassTests: SimpleTestRendering {

	@Test("classAddRemove", arguments: [true, false]) func classAddRemove(keepIt: Bool) async throws {
		let newDiv = Div {
			Span {
				let p = P("barfaroni")
					.addClass(.emphasize)
				if keepIt {
					p
				} else {
					p.removeClass(.emphasize)
				}
			}
		}

		let rendered = try simpleRender(newDiv)

		let expectationKeep = #"<div><span><p class="emphasize">barfaroni</p></span></div>"#
		let expectationDont = #"<div><span><p>barfaroni</p></span></div>"#

		if keepIt {
			#expect(expectationKeep == rendered)
		} else {
			#expect(expectationDont == rendered)
		}
	}

	@Test("classAddRemoveNoNullifyEmpty", arguments: [true, false]) func classAddRemove2(keepIt: Bool) async throws {
		let newDiv = Div {
			Span {
				let p = P("barfaroni")
					.addClass("emphasize")
					.customizingOptions {
						$0?.nullifyEmptyAttributes = false
					}
				if keepIt {
					p
				} else {
					p.removeClass("emphasize")
				}
			}
		}

		let rendered = try simpleRender(newDiv)

		let expectationKeep = #"<div><span><p class="emphasize">barfaroni</p></span></div>"#
		let expectationDont = #"<div><span><p class="">barfaroni</p></span></div>"#

		if keepIt {
			#expect(expectationKeep == rendered)
		} else {
			#expect(expectationDont == rendered)
		}
	}
}

extension ClassValue {
	static let emphasize: ClassValue = "emphasize"
}
