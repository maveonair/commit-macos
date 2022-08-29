//
//  CommitApp.swift
//  Commit
//
//  Created by Fabian Mettler on 27.05.22.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Bring window always to front
        NSApp.activate(ignoringOtherApps: true)
    }
}

@main
struct CommitApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowToolbarStyle(ExpandedWindowToolbarStyle())
    }
}
