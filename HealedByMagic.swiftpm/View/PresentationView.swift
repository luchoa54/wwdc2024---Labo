//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 15/02/24.
//

import Foundation
import SwiftUI

struct PresentationView: View {
    
    @State var moveToNewView : Bool = false
    @State private var finishSpeak: Bool = false
    @State var imageIndex = 0
    
    var body: some View {
        ZStack {
            
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24){
                
                Image(.image0)
                    .frame(width: 1000, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextBoxAndImageComponent(textArray: TextDataManager.worldIntroduction, finishSpeak: $finishSpeak,
                clickCount: $imageIndex, boxColor: 1)
                
                if !finishSpeak {
                    Text("Click on the diamond shaped icon to pass the character's speech")
                        .font(CustomFont().getFont(size: 32))
                        .foregroundStyle(.white)
                }
                
                if (finishSpeak) {
                    Button(action: { moveToNewView = true }) {
                        ButtonStyle("Run to the Lab", 1)
                    }
                    .padding(.top, 60)
                }
            }
            
            NavigationLink("", destination:  FirstExperimentView(), isActive: $moveToNewView)
        }
        .navigationBarBackButtonHidden()
    }
}
