#if canImport(Foundation)
import Foundation

package extension ISO8601DateFormatter {
	nonisolated(unsafe) static let internetTime: ISO8601DateFormatter = {
		let new = ISO8601DateFormatter()
		new.formatOptions = .withInternetDateTime
		return new
	}()
}
#endif
