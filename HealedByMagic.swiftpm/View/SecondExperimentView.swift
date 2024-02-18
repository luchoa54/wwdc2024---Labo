//
//  SecondExperimentView.swift
//
//
//  Created by Luciano Uchoa on 15/02/24.
//

import Foundation
import SwiftUI
import SpriteKit

struct SecondExperimentView: View {
    
    @State private var finishSpeak: Bool = false
    @State private var navigateToNewView: Bool = false
    
    var body: some View {
        VStack {
            
            SpriteView(scene: SecondExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: 800), $navigateToNewView))
                .frame(width: UIScreen.main.bounds.width, height: 800)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .statusBar(hidden: true)
                .ignoresSafeArea()
            
            HStack {
                TextBoxComponent(textArray: TextDataManager.potionIntroduction, finishSpeak: $finishSpeak)
                
                if finishSpeak {
                    Button(action: {
                        navigateToNewView.toggle()
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                }
            }

        }
        
        NavigationLink("", destination: SecondExperimentView(), isActive: $navigateToNewView)
    }
}
