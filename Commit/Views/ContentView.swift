//
//  ContentView.swift
//  Commit
//
//  Created by Fabian Mettler on 27.05.22.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = readEditCommitMessage()
    
    let editorFont = Font.system(size: 14).monospaced()

    var body: some View {
        TextEditor(text: $text)
            .font(editorFont)
            .toolbar {
                ToolbarItemGroup {
                    Button("Abort") {
                        exit(0)
                    }
                    Spacer()
                    Button("Commit") {
                        self.writeCommitMessage()
                    }
                }
            }
    }
    
    private func writeCommitMessage() {
        guard let filePath = CommandLine.arguments.last else {
            return
        }
        
        guard FileManager.default.fileExists(atPath: filePath) else {
            return
        }
                            
        do {
            let url = URL.init(fileURLWithPath: filePath)
            try self.text.write(to: url, atomically: true, encoding: .utf8)
            
            exit(0)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    private static func readEditCommitMessage() -> String {
        guard let filePath = CommandLine.arguments.last else {
            return "";
        }
        
        guard FileManager.default.fileExists(atPath: filePath) else {
            return "";
        }
        
        guard let content = FileManager.default.contents(atPath: filePath) else {
            print("Could not read content at \(filePath)")
            return "";
        }
        
        return String(decoding: content, as: UTF8.self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "foobar")
    }
}
