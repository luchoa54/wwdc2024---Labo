//
//  FirstExperimentView.swift
//
//
//  Created by Luciano Uchoa on 15/02/24.
//

import SwiftUI
import SpriteKit

struct FirstExperimentView: View {
    
    @State private var finishSpeak: Bool = false
    @State private var potionDone: Bool = false
    @State private var navigateToNewView: Bool = false
    
    var body: some View {
        ZStack {
            
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
           ZStack {
                
               HStack(spacing: 36) {
                   if !potionDone {
                       TextBoxComponent(textArray: TextDataManager.potionIntroduction, finishSpeak: $finishSpeak)
                           .padding(.horizontal, 24)
                           
                   } else {
                       TextBoxComponent(textArray: TextDataManager.potionDone, finishSpeak: $finishSpeak)
                           .padding(.leading, 24)
                           
                   }
                   
                   if potionDone {
                       Button(action: {
                           navigateToNewView.toggle()
                       }, label: {
                           ButtonExperimentStyle("Go to test!")
                       }).padding(.bottom, 8)
                   }
               }.padding(.bottom, 700)
                   .padding(.trailing, 36)
                
                SpriteView(scene: FirstExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: 810), $navigateToNewView, $potionDone), options: [.allowsTransparency])
                    .frame(width: UIScreen.main.bounds.width, height: 810)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .statusBar(hidden: true)
                    .padding(.top, 250)
            }
            
            NavigationLink("", destination: SecondExperimentView(), isActive: $navigateToNewView)
        }
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    FirstExperimentView()
}
