//
//  FinishView.swift
//
//
//  Created by Luciano Uchoa on 15/02/24.
//

import SwiftUI

struct FinishView: View {
    
    @State var canStartShowImages: Bool = false
    @State var clickCount: Int = 0
    @State var backToMenu: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                
                if canStartShowImages {
                    switch clickCount {
                        case 1:
                            Image(.icon)
                        case 2:
                            Image(.icon)
                        case 3:
                            Image(.icon)
                        case 4:
                            EmptyView()
                                .onAppear {
                                    backToMenu.toggle()
                                }
                        default:
                            EmptyView()
                    }
                }
                
                TextBoxAndImageComponent(textArray: TextDataManager.experimentDone, finishSpeak: $canStartShowImages, clickCount: $clickCount)
            }
        }
        
        NavigationLink("", destination: StartView(), isActive: $backToMenu)
    }
}
