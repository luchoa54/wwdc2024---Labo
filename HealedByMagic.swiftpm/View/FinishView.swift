//
//  FinishView.swift
//
//
//  Created by Luciano Uchoa on 15/02/24.
//

import SwiftUI

struct FinishView: View {
    
    @State var backToMenu: Bool = false
    @State var finishButtonIsUnlocked: Bool = false
    @State var showFinalDialog: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                if !showFinalDialog {
                    BeforeFinalView(showFinalDialog: $showFinalDialog)
                } else {
                    AfterFinishView(unlockFinishButton: $finishButtonIsUnlocked)
                }
                
                if finishButtonIsUnlocked {
                    Button(action: {
                        backToMenu.toggle()
                    }, label: {
                        ButtonStyle("Retry Experience")
                    })
                }
            }
            
            NavigationLink("", destination: StartView(), isActive: $backToMenu)
        }.navigationBarBackButtonHidden()
    }
}

struct BeforeFinalView: View {
    
    @Binding var showFinalDialog: Bool
    @State var clickCount: Int = 0
    
    var body: some View {
        
        viewForClickCount(clickCount)
        HStack {
            TextBoxAndImageComponent(textArray: TextDataManager.experimentDone, finishSpeak: $showFinalDialog, clickCount: $clickCount)
        }
    }
    
    func viewForClickCount(_ count: Int) -> AnyView {
        switch count {
            case 1:
                return AnyView(Image(systemName: "1.circle"))
            case 2:
                return AnyView(Image(systemName: "2.circle"))
            case 3:
                return AnyView(Image(systemName: "3.circle"))
            default:
                return AnyView(EmptyView())
        }
    }
}


struct AfterFinishView: View {
    
    @Binding var unlockFinishButton: Bool
    
    var body: some View {
        HStack {
            TextBoxComponent(textArray: TextDataManager.finishExperience, finishSpeak: $unlockFinishButton)
        }
    }
}
