//
//  ModifiersExampleView.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 30/09/20.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

extension View{
    func largeTitleStyle() -> some View {
        return self.modifier(TitleStyle())
    }
    
    func waterMarked(with text: String) -> some View {
        return self.modifier(WaterMark(text: text))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black)
        }
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ModifiersExampleView: View {
    var body: some View {
        VStack(spacing: 10) {
           Rectangle()
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(8)
            .waterMarked(with: "watermarked")
        }
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersExampleView()
    }
}
