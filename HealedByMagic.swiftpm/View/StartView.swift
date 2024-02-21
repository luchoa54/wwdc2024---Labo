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
                
                VStack(spacing: 50){
                    Text("HealedByMagic")
                        .font(.title)
                    Button(action: {
                        moveToNewView.toggle()
                    }, label: {
                        ButtonStyle("Tap to Play")
                    })
                }
                
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
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(.brown)
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
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(.red)
                    .frame(width: 200, height: 50)
            }
    }
}
