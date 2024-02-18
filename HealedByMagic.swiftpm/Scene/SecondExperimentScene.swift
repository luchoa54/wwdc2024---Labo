//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 13/02/24.
//

import Foundation
import SpriteKit
import SwiftUI

class SecondExperimentScene: SKScene {
    
    var dnaSequence: String = ExperimentStrings.inicialDNASequence
    var rnaSequence: String = ""
    var currentdnaSequenceIndex: Int = 0
    
    @Binding var moveTonewScene: Bool
    
    // MARK: - Initialization
    
    init(size: CGSize, _ moveTonewScene: Binding<Bool>) {
        _moveTonewScene = moveTonewScene
        super.init(size: size)
        setupScene()
        updatednaSequenceDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Scene Setup
    
    func setupScene() {
        for i in 0..<9 {
            addLabelNode(withText: "_", fontSize: 40, position: CGPoint(x: CGFloat(i * 100) + 100, y: 390), name: "letterSlot\(i)")
            addLabelNode(withText: "↑", fontSize: 30, position: CGPoint(x: CGFloat(i * 100) + 100, y: 460), name: "upArrow\(i)")
            addLabelNode(withText: "↓", fontSize: 30, position: CGPoint(x: CGFloat(i * 100) + 100 , y: 330), name: "downArrow\(i)")
        }
        
        addLabelNode(withText: "Confirmar", fontSize: 30, position: CGPoint(x: 450, y: 250), name: "confirmButton")
    }
    
    func addLabelNode(withText text: String, fontSize: CGFloat, position: CGPoint, name: String) {
        let labelNode = SKLabelNode(fontNamed: "Arial")
        labelNode.text = text
        labelNode.fontSize = fontSize
        labelNode.position = position
        labelNode.name = name
        addChild(labelNode)
    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if let arrowIndex = extractArrowIndex(from: node.name) {
                rotateDNALetter(index: arrowIndex, up: node.name?.hasPrefix("upArrow") ?? false)
            } else if node.name == "confirmButton" {
                handleConfirmButton()
            }
        }
    }
    
    func extractArrowIndex(from nodeName: String?) -> Int? {
        guard let nodeName = nodeName else { return nil }
        let arrowPrefix = "upArrow"
        let indexString = nodeName.replacingOccurrences(of: arrowPrefix, with: "")
                                  .replacingOccurrences(of: "downArrow", with: "")
        return Int(indexString)
    }
    
    // MARK: - Action Handling
    
    func handleConfirmButton() {
        transcribeDNAtoRNA()
        
        if checkRNA() {
            print("RNA correto! Processo concluído.")
            changeToNewView()
        } else {
            print("RNA incorreto. Tente novamente.")
        }
    }
    
    // MARK: - Scene Transition
    
    func changeToNewView() {
        self.run(.wait(forDuration: 3.0)) {
            self.moveTonewScene.toggle()
        }
    }
    
    // MARK: - DNA Manipulation
    
    func rotateDNALetter(index: Int, up: Bool) {
        let alphabet = "ATCG"
        
        guard index >= 0 && index < dnaSequence.count else { return }
        
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
        dnaSequence.replaceSubrange(dnaSequence.index(dnaSequence.startIndex, offsetBy: index)..<dnaSequence.index(dnaSequence.startIndex, offsetBy: index + 1), with: String(newChar))
        
        updatednaSequenceDisplay()
    }
    
    // MARK: - Display Updates
    
    func updatednaSequenceDisplay() {
        for (index, char) in dnaSequence.enumerated() {
            if let letterSlot = childNode(withName: "letterSlot\(index)") as? SKLabelNode {
                letterSlot.text = String(char)
            }
        }
    }
    
    // MARK: - RNA Transcription
    
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
    
    func checkRNA() -> Bool {
        return rnaSequence == ExperimentStrings.secondResponse
    }
    
    func showTranscriptionOnScreen() {
        let transcriptionLabel = SKLabelNode(fontNamed: "Arial")
        transcriptionLabel.text = "RNA: \(rnaSequence)"
        transcriptionLabel.fontSize = 25
        transcriptionLabel.position = CGPoint(x: 500, y: 500)
        transcriptionLabel.name = "transcriptionLabel"
        
        if let previousTranscriptionLabel = childNode(withName: "transcriptionLabel") {
            previousTranscriptionLabel.removeFromParent()
        }
        
        addChild(transcriptionLabel)
    }
    
    // MARK: - Animation
    
    func createPotion() {
        // Implement potion creation animation here
    }
}
