//
//  ContentView.swift
//  Styling SwiftUI Components Tutorial
//
//  Created by Leonardo Maia Pugliese on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
                        
            Button("Next") {
                print("Go to the screen")
            }
            
            Button("Delete", role: .destructive, action: {
                print("Delete some code here.")
            })
            
        }.animation(.default, value: currentPage)
        .padding()
        .buttonStyle(DefaultButtonStyle())
    }
}

struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        let label = configuration.label
        let color = configuration.role == .destructive ? Color.red : Color.blue
        
        HStack {
            Spacer()
            label
            Spacer()
        }
        .font(.system(.title, design: .rounded, weight: .bold))
        .foregroundColor(.white)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
        }
        .scaleEffect(x: configuration.isPressed ? 0.96 : 1, y: configuration.isPressed ? 0.96 : 1)
    }
}

extension PrimitiveButtonStyle where Self == DefaultButtonPrimitiveStyle {
    static var defaultButton: DefaultButtonPrimitiveStyle {
        DefaultButtonPrimitiveStyle()
    }
}

struct DefaultButtonPrimitiveStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        let label = configuration.label
//        let color = configuration.role == .destructive ? Color.red : Color.blue
        
        return HStack {
            Spacer()
            label
            Spacer()
        }
        .font(.system(.title, design: .rounded, weight: .bold))
        .foregroundColor(.white)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.blue)
        }
        .onTapGesture {
            configuration.trigger()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
