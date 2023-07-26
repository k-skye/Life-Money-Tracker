//
//  AppDelegate.swift
//  Life&MoneyTracker
//
//  Created by kang on 26/7/2023.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
            // Create the main window

        }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}

