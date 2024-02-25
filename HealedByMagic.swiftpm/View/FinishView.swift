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
            
            Image(.background2)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 36) {
                
                if !showFinalDialog {
                    BeforeFinalView(showFinalDialog: $showFinalDialog)
                } else {
                    AfterFinishView(unlockFinishButton: $finishButtonIsUnlocked)
                }
                
                if finishButtonIsUnlocked {
                    Button(action: {
                        backToMenu.toggle()
                    }, label: {
                        ButtonStyle("Retry Experience", 2)
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
        VStack(spacing: 24) {
            Image(viewForClickCount(clickCount))
                .frame(width: 1000, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack {
                TextBoxAndImageComponent(textArray: TextDataManager.experimentDone, finishSpeak: $showFinalDialog, clickCount: $clickCount, boxColor: 2)
            }
        }
    }
    
    func viewForClickCount(_ count: Int) -> String {
        switch count {
            case 1:
                return "imagem1"
            case 2:
                return "imagem2"
            case 3:
                return "imagem3"
            default:
                return "false"
        }
    }
}


struct AfterFinishView: View {
    
    @Binding var unlockFinishButton: Bool
    
    var body: some View {
        VStack(spacing: 30){
            
            Image(.jaqueline)
                .resizable()
                .frame(width: 500, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 10)
                )
            HStack {
                TextBoxComponent(textArray: TextDataManager.finishExperience, finishSpeak: $unlockFinishButton, boxColor: 2)
            }
        }
    }
}
