import Foundation
import yaHDSL

public class NavigationController<Context>: @unchecked Sendable {
	public typealias Condition = @Sendable (Context?) -> Bool
	public struct ItemStore {
		let condition: Condition
		var sortPriority: Double
		let item: NavigationItem
	}

	public struct NavigationItem: Sendable {
		var body: @Sendable () -> any HTMLNode
	}

	private let lock = NSLock()
	nonisolated(unsafe)
	private var _registeredNavItems: [ItemStore] = []
	public var registeredNavItems: [ItemStore] { lock.withLock { _registeredNavItems } }

	public func registerNavItem(
		_ navItem: NavigationItem,
		sortPriority: Double? = nil,
		condition: @escaping Condition = { _ in true }
	) {
		let priority = {
			guard let sortPriority else {
				guard let sortPriority = registeredNavItems.last?.sortPriority else {
					return 10.0
				}
				return sortPriority + 10.0
			}
			return sortPriority
		}()
		let item = ItemStore(condition: condition, sortPriority: priority, item: navItem)

		lock.withLock {
			_registeredNavItems.append(item)
			_registeredNavItems.sort(by: { $0.sortPriority < $1.sortPriority })
		}
	}

	public func navItems(with context: Context?) -> [NavigationItem] {
		registeredNavItems
			.compactMap {
				guard $0.condition(context) else { return nil }
				return $0.item
			}
	}
}
