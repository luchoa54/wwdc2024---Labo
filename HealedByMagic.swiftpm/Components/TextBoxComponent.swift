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
    
    @State var textSpeed: CGFloat = 1.0
    @State var boxColor: Int
    
    var body: some View {
        ZStack {
            
            HStack() {
                
                Image(getCurrentEmotion(textArray: textArray))
                    .resizable()
                    .frame(width: 150, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 220)
                
                Spacer()
                    .frame(width: 25)
                
                HStack {
                    Text(getCurrentText(textArray: textArray))
                        .font(CustomFont().getFont(size: 32))
                        .multilineTextAlignment(.center)
                        .frame(width: 710, height: 144, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .onAppear {
                            TextWriteOnScreen(textArray: textArray, 2.0)
                        }
                        
                    VStack {
                        Spacer()
                        
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
                    }.frame(width: 50, height: 145, alignment: .leading)
                        
                }.padding(.trailing, 210)
                
            }.background {
                Image("textbox\(boxColor)")
                    .frame(width: 1000, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }.padding(.bottom, 12)
            .frame(width: 1000, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
    
    func getCurrentText(textArray : [TextDataManager]) -> String {
        let currentText = textArray[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
    
    func getCurrentEmotion(textArray: [TextDataManager]) -> String {
        return String(textArray[self.currentTextIndex].emotion.rawValue)
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

#Preview {
    TextBoxComponent(textArray: TextDataManager.experimentDone, finishSpeak: .constant(false), boxColor: 1)
}

struct TextBoxAndImageComponent: View {
    
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0
    
    @State var textArray: [TextDataManager]
    
    @Binding var finishSpeak: Bool
    @Binding var clickCount: Int
    
    @State var textSpeed: CGFloat = 0.5
    @State var boxColor: Int
    
    var body: some View {
        ZStack {
            
            HStack() {
                
                Image(getCurrentEmotion(textArray: textArray))
                    .resizable()
                    .frame(width: 150, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 220)
                
                Spacer()
                    .frame(width: 25)
                
                HStack {
                    Text(getCurrentText(textArray: textArray))
                        .font(CustomFont().getFont(size: 32))
                        .multilineTextAlignment(.center)
                        .frame(width: 710, height: 144, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .onAppear {
                            TextWriteOnScreen(textArray: textArray, 2.0)
                        }
                        
                    VStack {
                        Spacer()
                        
                        if !finishSpeak {
                            Button(action: {
                                self.currentTextIndex = (self.currentTextIndex + 1) % textArray.count
                                self.currentTextCount = 0
                                clickCount += 1
                            }){
                                Image("textdone")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                        }
                    }.frame(width: 50, height: 145, alignment: .leading)
                        
                }.padding(.trailing, 210)
                
            }.background {
                Image("textbox\(boxColor)")
                    .frame(width: 1000, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }.padding(.bottom, 12)
            .frame(width: 1000, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
    
    func getCurrentEmotion(textArray: [TextDataManager]) -> String {
        return String(textArray[self.currentTextIndex].emotion.rawValue)
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

#Preview {
    TextBoxComponent(textArray: TextDataManager.worldIntroduction, finishSpeak: .constant(false), boxColor: 1)
}
