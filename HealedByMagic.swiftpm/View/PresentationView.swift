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
    
    var body: some View {
        ZStack {
            
            VStack {
                TextBoxComponent(textArray: TextDataManager.worldIntroduction)
            }
        }
    }
}
