import Cocoa

autoreleasepool {
    let app = NSApplication.shared
    let appDelegate = AppDelegate()
    app.delegate = appDelegate
    app.mainMenu = app.customMenu
    app.setActivationPolicy(.regular)

    app.run()
}

class AppDelegate: NSObject, NSApplicationDelegate {
    let controller: WindowController

    override init() {
        self.controller = WindowController()
        super.init()
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        controller.showWindow()
    }
}

extension NSApplication {
    var customMenu: NSMenu {
        let appMenu = NSMenuItem()
        appMenu.submenu = NSMenu()
        let appName = ProcessInfo.processInfo.processName
        appMenu.submenu?.addItem(
            NSMenuItem(
                title: "About \(appName)",
                action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""
            ))
        appMenu.submenu?.addItem(NSMenuItem.separator())
        appMenu.submenu?.addItem(
            NSMenuItem(
                title: "Quit \(appName)", action: #selector(NSApplication.terminate(_:)),
                keyEquivalent: "q"))

        let mainMenu = NSMenu(title: "Main Menu")
        mainMenu.addItem(appMenu)
        return mainMenu
    }
}
