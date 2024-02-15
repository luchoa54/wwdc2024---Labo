//
//  FirstExperimentScene.swift
//
//
//  Created by Luciano Uchoa on 13/02/24.
//

import Foundation
import SpriteKit
import SwiftUI

class FirstExperimentScene: SKScene {
    
    var dnaSequence: String = "AAAAAAAAA"
    var rnaSequence: String = ""
    var currentdnaSequenceIndex: Int = 0
    
    @Binding var moveTonewScene: Bool
    
    override func didMove(to view: SKView) {
        setupScene()
        updatednaSequenceDisplay()
    }
    
    init(size: CGSize, _ newScene: Binding<Bool>) {
        _moveTonewScene = newScene
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    class func newScene() -> FirstExperimentScene {
//        let scene = FirstExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: 600))
//        scene.scaleMode = .aspectFit
//        return scene
//    }
    
    func setupScene() {
       
        for i in 0..<9 {
            let letterSlot = SKLabelNode(fontNamed: "Arial")
            letterSlot.text = "_"
            letterSlot.fontSize = 40
            letterSlot.position = CGPoint(x: CGFloat(i * 100) + 100, y: 390)
            letterSlot.name = "letterSlot\(i)"
            addChild(letterSlot)
            
            let upArrow = SKLabelNode(fontNamed: "Arial")
            upArrow.text = "↑"
            upArrow.fontSize = 30
            upArrow.position = CGPoint(x: CGFloat(i * 100) + 100, y: 460)
            upArrow.name = "upArrow\(i)"
            addChild(upArrow)
            
            let downArrow = SKLabelNode(fontNamed: "Arial")
            downArrow.text = "↓"
            downArrow.fontSize = 30
            downArrow.position = CGPoint(x: CGFloat(i * 100) + 100 , y: 330)
            downArrow.name = "downArrow\(i)"
            addChild(downArrow)
        }
        
        let confirmButton = SKLabelNode(fontNamed: "Arial")
        confirmButton.text = "Confirmar"
        confirmButton.fontSize = 30
        confirmButton.position = CGPoint(x: 450, y: 250)
        confirmButton.name = "confirmButton"
        addChild(confirmButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if node.name?.hasPrefix("upArrow") ?? false {
                if let index = Int(node.name!.replacingOccurrences(of: "upArrow", with: "")) {
                    rotateDNALetter(index: index, up: true)
                }
            } else if node.name?.hasPrefix("downArrow") ?? false {
                if let index = Int(node.name!.replacingOccurrences(of: "downArrow", with: "")) {
                    rotateDNALetter(index: index, up: false)
                }
            } else if node.name == "confirmButton" {
                moveTonewScene.toggle()
                transcribeDNAtoRNA()
                if checkRNA() {
                    print("RNA correto! Processo concluído.")
                    resetDNA()
                } else {
                    print("RNA incorreto. Tente novamente.")
                }
            }
        }
    }
    
    func rotateDNALetter(index: Int, up: Bool) {
        let alphabet = "UACG"
        
        guard index >= 0 && index < dnaSequence.count else {
            return
        }
        
        var currentIndex = alphabet.firstIndex(of: dnaSequence[dnaSequence.index(dnaSequence.startIndex, offsetBy: index)])!
        
        if up {
            currentIndex = alphabet.index(after: currentIndex)
            if currentIndex == alphabet.endIndex {
                currentIndex = alphabet.startIndex
            }
        } else {
            if currentIndex == alphabet.startIndex {
                currentIndex = alphabet.index(before: alphabet.endIndex)
            } else {
                currentIndex = alphabet.index(before: currentIndex)
            }
        }
        
        let newChar = alphabet[currentIndex]
        let updateddnaSequence = dnaSequence.prefix(index) + String(newChar) + dnaSequence.suffix(from: dnaSequence.index(dnaSequence.startIndex, offsetBy: index + 1))
        dnaSequence = String(updateddnaSequence)
        
        updatednaSequenceDisplay()
    }
    
    func updatednaSequenceDisplay() {
        for (index, char) in dnaSequence.enumerated() {
            if let letterSlot = childNode(withName: "letterSlot\(index)") as? SKLabelNode {
                letterSlot.text = String(char)
            }
        }
    }
    
    func transcribeDNAtoRNA() {
        rnaSequence = ""
        for char in dnaSequence {
            switch char {
                case "A":
                    rnaSequence += "U"
                case "T":
                    rnaSequence += "A"
                case "C":
                    rnaSequence += "G"
                case "G":
                    rnaSequence += "C"
                default:
                    rnaSequence += String(char)
            }
        }
        showTranscriptionOnScreen()
    }
    
    //TODO: Trocar para lógica de tradução de DNA para mRNA
    func checkdnaSequence() -> Bool {
        return dnaSequence == "AAAAAAAAG"
    }
    
    func resetDNA() {
        self.dnaSequence = "AAAAAAAAA"
        self.currentdnaSequenceIndex = 0
        
        updatednaSequenceDisplay()
    }
    
    func checkRNA() -> Bool {
        return rnaSequence == "UUUUUUUUC"
    }
    
    func showTranscriptionOnScreen() {
        let transcriptionLabel = SKLabelNode(fontNamed: "Arial")
        transcriptionLabel.text = "RNA: \(rnaSequence)"
        transcriptionLabel.fontSize = 25
        transcriptionLabel.position = CGPoint(x: 500, y: 100)
        transcriptionLabel.name = "transcriptionLabel"
        
        if let previousTranscriptionLabel = childNode(withName: "transcriptionLabel") {
            previousTranscriptionLabel.removeFromParent()
        }
        
        addChild(transcriptionLabel)
    }
    
    //Animação das poções
    func createPotion() {}
    
}

