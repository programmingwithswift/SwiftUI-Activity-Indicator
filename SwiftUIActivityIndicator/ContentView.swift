//
//  ContentView.swift
//  SwiftUIActivityIndicator
//
//  Created by Darren Leak on 2019/11/12.
//  Copyright © 2019 ProgrammingWithSwift. All rights reserved.
//
 
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

struct ContentView: View {
    @State private var shouldAnimate = false
    
    var body: some View {
        // 1
        VStack {
            // 2
            ActivityIndicator(shouldAnimate: self.$shouldAnimate)
            
            // 3
            Button(action: {
                // 4
                self.shouldAnimate = !self.shouldAnimate
            }, label: {
                Text("Stop/Start")
                    .foregroundColor(Color.white)
                    .padding()
            })
                .background(Color.green)
                .cornerRadius(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
