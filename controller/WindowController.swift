import Cocoa
import Foundation

class WindowController: NSWindowController {
    init() {
        let newWindow = NSWindow(
            contentRect: NSMakeRect(10, 10, 600, 500),
            styleMask: [.titled, .resizable, .closable, .miniaturizable], backing: .buffered,
            defer: false)
        super.init(window: newWindow)

        if let window {
            let metalLayerView = MetalLayerView(
                frame: NSRect(origin: CGPoint.zero, size: window.frame.size))
            window.contentView = metalLayerView
        }
    }

    func showWindow() {
        if let window {
            window.center()
            window.setFrameAutosaveName("metal-resize")
            window.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
