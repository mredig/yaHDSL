import yaHDSL

protocol SimpleTestRendering {}
extension SimpleTestRendering {
	func simpleRender<Component: HTMLNode>(
		_ component: Component,
		mode: yaHTMLDocument.Context.Mode = .minify
	) throws -> String {
		let context = yaHTMLDocument.Context(mode: mode, userInfo: [:])
		let output = try component.render(withContext: context)
		print(output)
		return output
	}
}
