import Testing
import Foundation
import yaHDSL

struct CharMapTests: SimpleTestRendering {
	@Test func characterMapping() async throws {
		let str = "Does character mapping work? &/Or doesn't it?! 🧐"

		let htmlSafe = str
			.reduce(into: "") {
				guard $1.unicodeScalars.allSatisfy(CharacterMapper.attributeValueAllowedCharacters.contains) else {
					return $0.append(CharacterMapper.preferName(for: $1))
				}
				$0.append($1)
			}

		let expectation = #"Does character mapping work? &AMP;/Or doesn&apos;t it?! &x1F9D0;"#
		#expect(expectation == htmlSafe)
	}

}
