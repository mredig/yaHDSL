#if canImport(Foundation)
import Foundation
#endif
#if canImport(Crypto)
import Crypto
#elseif canImport(CryptoKit)
import CryptoKit
#endif

public struct Script: HTMLTextContainer, GlobalAttributable, EventAttributable {
	public var tag: String? { "script" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.init(text: text)
	}

	#if canImport(Foundation)
	public init(src: URL) {
		self.init(src: src.absoluteString)
	}
	#endif

	public init(src: String) {
		self.init("")
		self = withSrc(src)
	}

	public init(
		text: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
		self.text = text
	}

}

public extension Script {
	func withAsync(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .async)
		} else {
			removeAttribute(named: .async)
		}
	}

	typealias CrossOriginPolicy = Img.CrossOriginPolicy
	func withCrossOrigin(_ policy: CrossOriginPolicy) -> Self {
		setAttribute(named: .crossorigin, value: policy)
	}

	func withDefer(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .defer)
		} else {
			removeAttribute(named: .defer)
		}
	}

	typealias FetchPriority = Img.FetchPriority
	func withFetchPriority(_ priority: FetchPriority) -> Self {
		setAttribute(named: .fetchpriority, value: priority)
	}

	func withIntegrity(_ b64: String) -> Self {
		setAttribute(named: .integrity, value: b64)
	}

	func withIntegrity(_ hash: Data) -> Self {
		setAttribute(named: .integrity, value: .b64Data(hash, options: []))
	}

	#if canImport(Crypto) || canImport(CryptoKit)
	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA256.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha256-\(b64data)")
	}

	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA384.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha384-\(b64data)")
	}

	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA512.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha512-\(b64data)")
	}
	#endif

	func withNoModule(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .nomodule)
		} else {
			removeAttribute(named: .nomodule)
		}
	}

	func withNonce(_ value: String) -> Self {
		setAttribute(named: .nonce, value: value)
	}

	typealias ReferrerPolicy = A.ReferrerPolicy
	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy)
	}


	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}
	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif
	func withType(_ scriptType: String) -> Self {
		setAttribute(named: .type, value: scriptType)
	}
}
