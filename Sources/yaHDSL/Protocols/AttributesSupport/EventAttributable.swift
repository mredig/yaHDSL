public protocol EventAttributable: Attributable {}

public extension EventAttributable {
	func setOnAfterPrint(_ js: String) -> Self {
		setAttribute(named: .onafterprint, value: js)
	}

	func setOnBeforePrint(_ js: String) -> Self {
		setAttribute(named: .onbeforeprint, value: js)
	}

	func setOnBeforeUnload(_ js: String) -> Self {
		setAttribute(named: .onbeforeunload, value: js)
	}

	func setOnError(_ js: String) -> Self {
		setAttribute(named: .onerror, value: js)
	}

	func setOnHashChange(_ js: String) -> Self {
		setAttribute(named: .onhashchange, value: js)
	}

	func setOnLoad(_ js: String) -> Self {
		setAttribute(named: .onload, value: js)
	}

	func setOnMessage(_ js: String) -> Self {
		setAttribute(named: .onmessage, value: js)
	}

	func setOnOffline(_ js: String) -> Self {
		setAttribute(named: .onoffline, value: js)
	}

	func setOnOnline(_ js: String) -> Self {
		setAttribute(named: .ononline, value: js)
	}

	func setOnPageHide(_ js: String) -> Self {
		setAttribute(named: .onpagehide, value: js)
	}

	func setOnPageShow(_ js: String) -> Self {
		setAttribute(named: .onpageshow, value: js)
	}

	func setOnPopState(_ js: String) -> Self {
		setAttribute(named: .onpopstate, value: js)
	}

	func setOnResize(_ js: String) -> Self {
		setAttribute(named: .onresize, value: js)
	}

	func setOnStorage(_ js: String) -> Self {
		setAttribute(named: .onstorage, value: js)
	}

	func setOnUnload(_ js: String) -> Self {
		setAttribute(named: .onunload, value: js)
	}

	func setOnBlur(_ js: String) -> Self {
		setAttribute(named: .onblur, value: js)
	}

	func setOnChange(_ js: String) -> Self {
		setAttribute(named: .onchange, value: js)
	}

	func setOnContextMenu(_ js: String) -> Self {
		setAttribute(named: .oncontextmenu, value: js)
	}

	func setOnFocus(_ js: String) -> Self {
		setAttribute(named: .onfocus, value: js)
	}

	func setOnInput(_ js: String) -> Self {
		setAttribute(named: .oninput, value: js)
	}

	func setOnInvalid(_ js: String) -> Self {
		setAttribute(named: .oninvalid, value: js)
	}

	func setOnReset(_ js: String) -> Self {
		setAttribute(named: .onreset, value: js)
	}

	func setOnSearch(_ js: String) -> Self {
		setAttribute(named: .onsearch, value: js)
	}

	func setOnSelect(_ js: String) -> Self {
		setAttribute(named: .onselect, value: js)
	}

	func setOnSubmit(_ js: String) -> Self {
		setAttribute(named: .onsubmit, value: js)
	}

	func setOnKeyDown(_ js: String) -> Self {
		setAttribute(named: .onkeydown, value: js)
	}

	func setOnKeyPress(_ js: String) -> Self {
		setAttribute(named: .onkeypress, value: js)
	}

	func setOnKeyUp(_ js: String) -> Self {
		setAttribute(named: .onkeyup, value: js)
	}

	func setOnClick(_ js: String) -> Self {
		setAttribute(named: .onclick, value: js)
	}

	func setOnDblclick(_ js: String) -> Self {
		setAttribute(named: .ondblclick, value: js)
	}

	func setOnMouseDown(_ js: String) -> Self {
		setAttribute(named: .onmousedown, value: js)
	}

	func setOnMouseMove(_ js: String) -> Self {
		setAttribute(named: .onmousemove, value: js)
	}

	func setOnMouseOut(_ js: String) -> Self {
		setAttribute(named: .onmouseout, value: js)
	}

	func setOnMouseOver(_ js: String) -> Self {
		setAttribute(named: .onmouseover, value: js)
	}

	func setOnMouseUp(_ js: String) -> Self {
		setAttribute(named: .onmouseup, value: js)
	}

	func setOnMouseWheel(_ js: String) -> Self {
		setAttribute(named: .onmousewheel, value: js)
	}

	func setOnWheel(_ js: String) -> Self {
		setAttribute(named: .onwheel, value: js)
	}

	func setOnDrag(_ js: String) -> Self {
		setAttribute(named: .ondrag, value: js)
	}

	func setOnDragEnd(_ js: String) -> Self {
		setAttribute(named: .ondragend, value: js)
	}

	func setOnDragEnter(_ js: String) -> Self {
		setAttribute(named: .ondragenter, value: js)
	}

	func setOnDragLeave(_ js: String) -> Self {
		setAttribute(named: .ondragleave, value: js)
	}

	func setOnDragOver(_ js: String) -> Self {
		setAttribute(named: .ondragover, value: js)
	}

	func setOnDragStart(_ js: String) -> Self {
		setAttribute(named: .ondragstart, value: js)
	}

	func setOnDrop(_ js: String) -> Self {
		setAttribute(named: .ondrop, value: js)
	}

	func setOnScroll(_ js: String) -> Self {
		setAttribute(named: .onscroll, value: js)
	}

	func setOnCopy(_ js: String) -> Self {
		setAttribute(named: .oncopy, value: js)
	}

	func setOnCut(_ js: String) -> Self {
		setAttribute(named: .oncut, value: js)
	}

	func setOnPaste(_ js: String) -> Self {
		setAttribute(named: .onpaste, value: js)
	}

	func setOnAbort(_ js: String) -> Self {
		setAttribute(named: .onabort, value: js)
	}

	func setOnCanPlay(_ js: String) -> Self {
		setAttribute(named: .oncanplay, value: js)
	}

	func setOnCanPlayThrough(_ js: String) -> Self {
		setAttribute(named: .oncanplaythrough, value: js)
	}

	func setOnCueChange(_ js: String) -> Self {
		setAttribute(named: .oncuechange, value: js)
	}

	func setOnDurationChange(_ js: String) -> Self {
		setAttribute(named: .ondurationchange, value: js)
	}

	func setOnEmptied(_ js: String) -> Self {
		setAttribute(named: .onemptied, value: js)
	}

	func setOnEnded(_ js: String) -> Self {
		setAttribute(named: .onended, value: js)
	}

	func setOnLoadedData(_ js: String) -> Self {
		setAttribute(named: .onloadeddata, value: js)
	}

	func setOnLoadedMetadata(_ js: String) -> Self {
		setAttribute(named: .onloadedmetadata, value: js)
	}

	func setOnLoadStart(_ js: String) -> Self {
		setAttribute(named: .onloadstart, value: js)
	}

	func setOnPause(_ js: String) -> Self {
		setAttribute(named: .onpause, value: js)
	}

	func setOnPlay(_ js: String) -> Self {
		setAttribute(named: .onplay, value: js)
	}

	func setOnPlaying(_ js: String) -> Self {
		setAttribute(named: .onplaying, value: js)
	}

	func setOnProgress(_ js: String) -> Self {
		setAttribute(named: .onprogress, value: js)
	}

	func setOnRateChange(_ js: String) -> Self {
		setAttribute(named: .onratechange, value: js)
	}

	func setOnSeeked(_ js: String) -> Self {
		setAttribute(named: .onseeked, value: js)
	}

	func setOnSeeking(_ js: String) -> Self {
		setAttribute(named: .onseeking, value: js)
	}

	func setOnStalled(_ js: String) -> Self {
		setAttribute(named: .onstalled, value: js)
	}

	func setOnSuspend(_ js: String) -> Self {
		setAttribute(named: .onsuspend, value: js)
	}

	func setOnTimeUpdate(_ js: String) -> Self {
		setAttribute(named: .ontimeupdate, value: js)
	}

	func setOnVolumeChange(_ js: String) -> Self {
		setAttribute(named: .onvolumechange, value: js)
	}

	func setOnWaiting(_ js: String) -> Self {
		setAttribute(named: .onwaiting, value: js)
	}

	func setOnToggle(_ js: String) -> Self {
		setAttribute(named: .ontoggle, value: js)
	}
}

public extension AttributeName {
	// MARK: - Window Events
	static let onafterprint = AttributeName(rawValue: "onafterprint")!
	static let onbeforeprint = AttributeName(rawValue: "onbeforeprint")!
	static let onbeforeunload = AttributeName(rawValue: "onbeforeunload")!
	static let onerror = AttributeName(rawValue: "onerror")!
	static let onhashchange = AttributeName(rawValue: "onhashchange")!
	static let onload = AttributeName(rawValue: "onload")!
	static let onmessage = AttributeName(rawValue: "onmessage")!
	static let onoffline = AttributeName(rawValue: "onoffline")!
	static let ononline = AttributeName(rawValue: "ononline")!
	static let onpagehide = AttributeName(rawValue: "onpagehide")!
	static let onpageshow = AttributeName(rawValue: "onpageshow")!
	static let onpopstate = AttributeName(rawValue: "onpopstate")!
	static let onresize = AttributeName(rawValue: "onresize")!
	static let onstorage = AttributeName(rawValue: "onstorage")!
	static let onunload = AttributeName(rawValue: "onunload")!

	// MARK: - Form Events
	static let onblur = AttributeName(rawValue: "onblur")!
	static let onchange = AttributeName(rawValue: "onchange")!
	static let oncontextmenu = AttributeName(rawValue: "oncontextmenu")!
	static let onfocus = AttributeName(rawValue: "onfocus")!
	static let oninput = AttributeName(rawValue: "oninput")!
	static let oninvalid = AttributeName(rawValue: "oninvalid")!
	static let onreset = AttributeName(rawValue: "onreset")!
	static let onsearch = AttributeName(rawValue: "onsearch")!
	static let onselect = AttributeName(rawValue: "onselect")!
	static let onsubmit = AttributeName(rawValue: "onsubmit")!

	// MARK: - Keyboard Events
	static let onkeydown = AttributeName(rawValue: "onkeydown")!
	static let onkeypress = AttributeName(rawValue: "onkeypress")!
	static let onkeyup = AttributeName(rawValue: "onkeyup")!

	// MARK: - Mouse Events
	static let onclick = AttributeName(rawValue: "onclick")!
	static let ondblclick = AttributeName(rawValue: "ondblclick")!
	static let onmousedown = AttributeName(rawValue: "onmousedown")!
	static let onmousemove = AttributeName(rawValue: "onmousemove")!
	static let onmouseout = AttributeName(rawValue: "onmouseout")!
	static let onmouseover = AttributeName(rawValue: "onmouseover")!
	static let onmouseup = AttributeName(rawValue: "onmouseup")!
	static let onmousewheel = AttributeName(rawValue: "onmousewheel")!
	static let onwheel = AttributeName(rawValue: "onwheel")!

	// MARK: - Drag Events
	static let ondrag = AttributeName(rawValue: "ondrag")!
	static let ondragend = AttributeName(rawValue: "ondragend")!
	static let ondragenter = AttributeName(rawValue: "ondragenter")!
	static let ondragleave = AttributeName(rawValue: "ondragleave")!
	static let ondragover = AttributeName(rawValue: "ondragover")!
	static let ondragstart = AttributeName(rawValue: "ondragstart")!
	static let ondrop = AttributeName(rawValue: "ondrop")!
	static let onscroll = AttributeName(rawValue: "onscroll")!

	// MARK: - Clipboard Events
	static let oncopy = AttributeName(rawValue: "oncopy")!
	static let oncut = AttributeName(rawValue: "oncut")!
	static let onpaste = AttributeName(rawValue: "onpaste")!

	// MARK: - Media Events
	static let onabort = AttributeName(rawValue: "onabort")!
	static let oncanplay = AttributeName(rawValue: "oncanplay")!
	static let oncanplaythrough = AttributeName(rawValue: "oncanplaythrough")!
	static let oncuechange = AttributeName(rawValue: "oncuechange")!
	static let ondurationchange = AttributeName(rawValue: "ondurationchange")!
	static let onemptied = AttributeName(rawValue: "onemptied")!
	static let onended = AttributeName(rawValue: "onended")!
	static let onloadeddata = AttributeName(rawValue: "onloadeddata")!
	static let onloadedmetadata = AttributeName(rawValue: "onloadedmetadata")!
	static let onloadstart = AttributeName(rawValue: "onloadstart")!
	static let onpause = AttributeName(rawValue: "onpause")!
	static let onplay = AttributeName(rawValue: "onplay")!
	static let onplaying = AttributeName(rawValue: "onplaying")!
	static let onprogress = AttributeName(rawValue: "onprogress")!
	static let onratechange = AttributeName(rawValue: "onratechange")!
	static let onseeked = AttributeName(rawValue: "onseeked")!
	static let onseeking = AttributeName(rawValue: "onseeking")!
	static let onstalled = AttributeName(rawValue: "onstalled")!
	static let onsuspend = AttributeName(rawValue: "onsuspend")!
	static let ontimeupdate = AttributeName(rawValue: "ontimeupdate")!
	static let onvolumechange = AttributeName(rawValue: "onvolumechange")!
	static let onwaiting = AttributeName(rawValue: "onwaiting")!

	// MARK: - Misc
	static let ontoggle = AttributeName(rawValue: "ontoggle")!
}
