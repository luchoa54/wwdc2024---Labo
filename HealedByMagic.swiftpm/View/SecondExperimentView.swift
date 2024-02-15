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
            
            SpriteView(scene: SecondExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: 600), $navigateToNewView))
                .frame(width: UIScreen.main.bounds.width, height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .statusBar(hidden: true)
                .ignoresSafeArea()
            
            TextBoxComponent(textArray: TextDataManager.potionIntroduction, finishSpeak: $finishSpeak)

        }
        
        NavigationLink("", destination: SecondExperimentView(), isActive: $navigateToNewView)
    }
}
