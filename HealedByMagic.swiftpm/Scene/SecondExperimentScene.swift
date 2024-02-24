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
    var machineNode: SKNode = SKNode()
    var canClickButton: Bool = true
    
    @Binding var moveTonewScene: Bool
    @Binding var potionDone: Bool
    
    // MARK: - Initialization
    
    init(size: CGSize, _ moveTonewScene: Binding<Bool>, _ potionDone: Binding<Bool>) {
        _moveTonewScene = moveTonewScene
        _potionDone = potionDone
        super.init(size: size)
        setupScene()
        updatednaSequenceDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Scene Setup
    
    func setupScene() {
        let positions = [190,270, 348, 425, 502, 579, 659, 737, 815]
        for i in 0..<9 {
            addLabelNode(withText: "_", fontSize: 40, position: CGPoint(x: positions[i], y: 265), name: "letterSlot\(i)")
            addButtonNode(position: CGPoint(x: positions[i], y: i == 0 || i == 8 ? 380: 400), name: "upArrow\(i)", direction: .down)
            addButtonNode(position: CGPoint(x: positions[i] , y: i == 0 || i == 8 ? 180: 170), name: "downArrow\(i)", direction: .up)
        }
        
        addLabelNode(withText: "Confirm", fontSize: 30, position: CGPoint(x: 500, y: 60), name: "confirmButton")
        
        addLabelNode(withText: ExperimentStrings.secondResponse, fontSize: 80, position: CGPoint(x: 500, y: 480), name: "confirmButton")
        
        createMachineNode()
        createBackground()
    }
    
    func createMachineNode() {
        
        let texture = SKTexture(imageNamed: "machine8")
        texture.filteringMode = .nearest
        
        let machineNode = SKSpriteNode(texture: texture, size: CGSize(width: 1400, height: 1300))
        
        machineNode.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 380)
        machineNode.zPosition = 2
        
        let textureOverlay = SKTexture(imageNamed: "machineOverlay")
        texture.filteringMode = .nearest
        
        let machineOverlayNode = SKSpriteNode(texture: textureOverlay)
        
        machineOverlayNode.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 110)
        machineOverlayNode.zPosition = 3
        
        self.addChild(machineOverlayNode)
        
        self.machineNode = machineNode
        addChild(self.machineNode)
    }
    
    func createBackground() {
        self.backgroundColor = .clear
    }
    
    func addButtonNode(position: CGPoint, name: String, direction: arrowDirection) {
        let texture = SKTexture(imageNamed: "buttonMachine")
        texture.filteringMode = .nearest
        
        let button = SKSpriteNode(texture: texture)
        button.size = CGSize(width: 60, height: 80)
        button.position = position
        button.name = name
        button.zPosition = 6
        
        switch direction {
            case .up:
                button.yScale = -1
            case .down:
                button.yScale = 1
        }
        
        addChild(button)
    }
    
    func addLabelNode(withText text: String, fontSize: CGFloat, position: CGPoint, name: String) {
        let labelNode = SKLabelNode(fontNamed: "Arial")
        labelNode.text = text
        labelNode.fontColor = .black
        labelNode.fontSize = fontSize
        labelNode.position = position
        labelNode.name = name
        labelNode.zPosition = 5
        addChild(labelNode)
    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if let arrowIndex = extractArrowIndex(from: node.name) {
                rotateDNALetter(index: arrowIndex, up: node.name?.hasPrefix("upArrow") ?? false)
            } else if node.name == "confirmButton" && canClickButton {
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
        canClickButton.toggle()
        if checkRNA() {
            createPotion()
        } else {
            showIncorrectInput()
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
        transcribeDNAtoRNA()
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
        showCorrectInput()
        machineNode.run(.createPurplePotion())
        potionDone.toggle()
    }
    
    func showIncorrectInput() {
        if let responseNode = scene?.childNode(withName: "responseString") as? SKLabelNode {
            responseNode.fontSize = 50
            responseNode.text = "RNA doesn't match"
            responseNode.position.y += 10
            responseNode.fontColor = UIColor(red: 188 / 255, green: 71 / 255, blue: 73 / 255, alpha: 1)
            
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                responseNode.fontSize = 80
                responseNode.position.y -= 10
                responseNode.text = ExperimentStrings.secondResponse
                responseNode.fontColor = .black
                
                self.canClickButton.toggle()
            }
        }
    }
    
    func showCorrectInput() {
        if let responseNode = scene?.childNode(withName: "responseString") as? SKLabelNode {
            responseNode.text = "Success! Creatin potion..."
            responseNode.fontSize = 40
            responseNode.position.y += 10
            responseNode.fontColor = UIColor(red: 56 / 255, green: 102 / 255, blue: 65 / 255, alpha: 1)
        }
    }
}
