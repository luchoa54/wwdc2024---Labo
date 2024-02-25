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
                
                Image(.menu2)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .padding(.trailing, 500)
                
                VStack(spacing: 50){
                    Image(.logo)
                        .resizable()
                        .frame(width: 550, height: 550, alignment: .center)
                    Button(action: {
                        moveToNewView.toggle()
                    }, label: {
                        ButtonStyle("Tap to Play", 1)
                    })
                }.padding(.trailing, 800)
                    .padding(.bottom, 300)
                
                NavigationLink("", destination: PresentationView(), isActive: $moveToNewView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .statusBarHidden(true)
    }
}

struct ButtonExperimentStyle: View {
    
    var buttonString: String
    var buttonColor: Int
    
    init(_ buttonString: String, _ buttonColor: Int) {
        self.buttonString = buttonString
        self.buttonColor = buttonColor
    }
    
    var body: some View {
       Text(buttonString)
            .font(CustomFont().getFont(size: 32))
            .foregroundStyle(.black)
            .background {
                Image("bigButton\(buttonColor)")
                    .resizable()
                    .frame(width: 200, height: 180)
            }
    }
}

struct ButtonStyle: View {
    
    var buttonString: String
    var buttonColor: Int
    
    init(_ buttonString: String, _ buttonColor: Int) {
        self.buttonString = buttonString
        self.buttonColor = buttonColor
    }
    
    var body: some View {
       Text(buttonString)
            .font(CustomFont().getFont(size: 32))
            .foregroundStyle(.black)
            .background {
                Image("button\(buttonColor)")
                    .resizable()
                    .frame(width: 300, height: 100)
            }
    }
}
