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
            
            HStack(spacing: 12) {
                TextBoxComponent(textArray: TextDataManager.potionDone, finishSpeak: $finishSpeak)
                    .padding(.leading, 12)
                
                Spacer()
                    .frame(maxWidth: 100)
                
                if finishSpeak {
                    Button(action: {
                        withAnimation {
                            navigateToNewView.toggle()
                        }
                    }, label: {
                        ButtonExperimentStyle("Get Results")
                    })
                    .padding(.bottom, 12)
                    .padding(.trailing, 75)
                    
                }else {
                    Spacer()
                }
                
            }.padding(.top, 60)
            
            SpriteView(scene: SecondExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: 810), $navigateToNewView))
                .frame(width: UIScreen.main.bounds.width, height: 810)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .statusBar(hidden: true)
                .ignoresSafeArea()

        }.navigationBarBackButtonHidden()
        
        NavigationLink("", destination: FinishView(), isActive: $navigateToNewView)
    }
}
