//
//  PiDartApp.swift
//  Shared
//
//  Created by Geoffrey Lovelace on 6/26/20.
//

import SwiftUI

@main
struct PiDartApp: App {
    var user_data = UserData()
    var body: some Scene {
        return WindowGroup {
            ContentView().environmentObject(user_data)
        }
        .commands {
            CommandMenu("Calculate") {
                Button("Estimate Pi", action: {user_data.estimate_pi()})
                    .keyboardShortcut(KeyEquivalent("e"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
                    .disabled(user_data.calculating)
            }
        }
    }
}
