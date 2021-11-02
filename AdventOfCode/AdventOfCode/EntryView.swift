//
//  EntryView.swift
//  AdventOfCode
//
//  Created by Ryan Arana on 10/29/21.
//

import SwiftUI

struct EntryView: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var entry: Entry
    @State var showCopied = false
    @State var showWeb = false
    @State var showProgress = false

    var body: some View {
        HStack {
            Text("Day \(entry.day) Part \(entry.part)")

            Spacer()

            Text(entry.answer ?? "")
                .font(.system(.body).monospaced())
                .onTapGesture(perform: copyAnswerToClipboard)
                .popover(isPresented: $showCopied) {
                    Text("Copied!")
                        .padding(8)
                }
            
            Button(action: {
                Task {
                    try await entry.run()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { self.showProgress = false }
                }
                showProgress = true
            }) {
                Image(systemName: "play.fill")
            }
            .disabled(entry.progress.fractionCompleted > 0)
            .popover(isPresented: $showProgress) {
                ProgressView(entry.progress)
                    .frame(idealWidth: 200, alignment: .leading)
                    .padding()
            }

            Button(action: { self.showWeb = true }) {
                Image(systemName: "scroll.fill")
            }

            Button(action: { self.openURL(entry.webURL) }) {
                Image(systemName: "link.circle.fill")
            }

            Button(action: copyAnswerToClipboard) {
                Image(systemName: "doc.on.doc.fill")
            }
        }
        .padding()
        .frame(alignment: .leading)
        .buttonStyle(.borderless)
        .popover(isPresented: $showWeb) {
            AdventOfCodeWebView(entry: entry)
                .frame(minWidth: 860, idealWidth: 1024, idealHeight: 430)
        }
    }

    private func copyAnswerToClipboard() {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(entry.answer ?? "Not run yet", forType: .string)

        showCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showCopied = false
        }
    }
}
