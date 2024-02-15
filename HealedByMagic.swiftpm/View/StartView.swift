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
                
                VStack {
                    
                    Button(action: {
                        moveToNewView.toggle()
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                }
                
                NavigationLink("", destination: PresentationView(), isActive: $moveToNewView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden()
    }
}
