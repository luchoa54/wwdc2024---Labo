//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 15/02/24.
//

import Foundation
import SwiftUI


struct StartView: View {
    
    @State var moveToNewView : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image(.menu)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 50){
                    Image(.logo)
                        .resizable()
                        .frame(width: 550, height: 550, alignment: .center)
                    Button(action: {
                        moveToNewView.toggle()
                    }, label: {
                        ButtonStyle("Tap to Play")
                    })
                }.padding(.trailing, 800)
                    .padding(.bottom, 300)
                
                NavigationLink("", destination: PresentationView(), isActive: $moveToNewView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct ButtonExperimentStyle: View {
    
    var buttonString: String
    
    init(_ buttonString: String) {
        self.buttonString = buttonString
    }
    
    var body: some View {
       Text(buttonString)
            .font(.title2)
            .foregroundStyle(.white)
            .background {
                Image(.bigButton)
                    .frame(width: 200, height: 180)
            }
    }
}

struct ButtonStyle: View {
    
    var buttonString: String
    
    init(_ buttonString: String) {
        self.buttonString = buttonString
    }
    
    var body: some View {
       Text(buttonString)
            .font(.title2)
            .foregroundStyle(.white)
            .background {
                Image(.button)
                    .frame(width: 300, height: 100)
            }
    }
}
