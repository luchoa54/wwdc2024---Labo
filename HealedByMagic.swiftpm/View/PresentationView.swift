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
    
    var body: some View {
        ZStack {
            
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24){
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 1000, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                TextBoxComponent(textArray: TextDataManager.worldIntroduction, finishSpeak: $finishSpeak)
                
                if (finishSpeak) {
                    Button(action: { moveToNewView = true }) {
                        ButtonStyle("Run to the Lab")
                    }
                    .padding(.top, 60)
                }
            }
            
            NavigationLink("", destination:  FirstExperimentView(), isActive: $moveToNewView)
        }
        .navigationBarBackButtonHidden()
    }
}
