//
//  File.swift
//
//
//  Created by Luciano Uchoa on 15/02/24.
//

import Foundation
import SwiftUI


struct TextBoxComponent: View {
    
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0
    
    @State var textArray: [TextDataManager]
    
    @Binding var finishSpeak: Bool
    
    @State var textSpeed: CGFloat = 4.0
    
    var body: some View {
        ZStack {
            Text(getCurrentText(textArray: textArray))
                .font(.custom("Arial", size: 24))
                .multilineTextAlignment(.center)
                .onAppear {
                    TextWriteOnScreen(textArray: textArray, textSpeed)
                }
            
            
            HStack {
                if !finishSpeak {
                    Button(action: {
                        self.currentTextIndex = (self.currentTextIndex + 1) % textArray.count
                        self.currentTextCount = 0
                    }){
                        Image("textdone")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                }
            }
            .padding(.leading, 535)
            .padding(.top, 50)
        }
        .frame(width: 620, height: 200)
        
    }
    
    func getCurrentText(textArray : [TextDataManager]) -> String {
        let currentText = textArray[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
    
    func TextWriteOnScreen(textArray: [TextDataManager], _ textSpeed: CGFloat) {
        let totalTime = textSpeed
        let charCount = Double(textArray[self.currentTextIndex].text.count)
        let interval = totalTime / charCount
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            if self.currentTextCount < textArray[self.currentTextIndex].text.count {
                self.currentTextCount += 1
                if self.currentTextIndex == textArray.count - 1 {
                    self.finishSpeak = true
                }
            }
        }
        timer.fire()
    }
}

struct TextBoxAndImageComponent: View {
    
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0
    
    @State var textArray: [TextDataManager]
    
    @Binding var finishSpeak: Bool
    @Binding var clickCount: Int
    
    @State var textSpeed: CGFloat = 2.0
    
    var body: some View {
        ZStack {
            Text(getCurrentText(textArray: textArray))
                .font(.custom("Arial", size: 24))
                .multilineTextAlignment(.center)
                .onAppear {
                    TextWriteOnScreen(textArray: textArray, textSpeed)
                }
            
            HStack {
                if !finishSpeak {
                    Button(action: {
                        self.currentTextIndex = (self.currentTextIndex + 1) % textArray.count
                        self.currentTextCount = 0
                    }){
                        Image("textdone")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                }
            }
            .padding(.leading, 535)
            .padding(.top, 250)
        }
        .frame(width: 620, height: 200)
        
    }
    
    func getCurrentText(textArray : [TextDataManager]) -> String {
        let currentText = textArray[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
    
    func TextWriteOnScreen(textArray: [TextDataManager], _ textSpeed: CGFloat) {
        let totalTime = textSpeed
        let charCount = Double(textArray[self.currentTextIndex].text.count)
        let interval = totalTime / charCount
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            if self.currentTextCount < textArray[self.currentTextIndex].text.count {
                self.currentTextCount += 1
                if self.currentTextIndex == textArray.count - 1 {
                    self.finishSpeak = true
                }
            }
        }
        timer.fire()
    }
}
