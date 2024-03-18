//
//  ContentView.swift
//  ChatGPTSwiftUI
//
//  Created by 于鸿鹏 on 6/16/23.
//  Copyright © 2023 于鸿鹏. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                let api = ChatGPTAPI(apiKey: apiKey)
                do {
                    let stream = try await api.sendMessage("你是谁？")
//                    for try await line in stream {
//                        print(line)
//                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
