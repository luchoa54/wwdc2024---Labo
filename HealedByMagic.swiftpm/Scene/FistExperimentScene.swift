//
//  File.swift
//
//
//  Created by Luciano Uchoa on 13/02/24.
//

import Foundation
import SpriteKit

class FirstExperimentScene: SKScene {
    
    var password: String = "AAC" // Senha inicial
    var currentPasswordIndex: Int = 0
    
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    class func newScene() -> FirstExperimentScene {
        let scene = FirstExperimentScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    func setupScene() {
        // Adicione aqui a configuração inicial do cenário, como o fundo, cofre, etc.
        // ...
        
        // Adicione os espaços para as letras e setas
        for i in 0..<3 {
            let letterSlot = SKLabelNode(fontNamed: "Arial")
            letterSlot.text = "_"
            letterSlot.fontSize = 40
            letterSlot.position = CGPoint(x: CGFloat(i * 100), y: 200)
            letterSlot.name = "letterSlot\(i)"
            addChild(letterSlot)
            
            let upArrow = SKLabelNode(fontNamed: "Arial")
            upArrow.text = "↑"
            upArrow.fontSize = 30
            upArrow.position = CGPoint(x: CGFloat(i * 100), y: 240)
            upArrow.name = "upArrow\(i)"
            addChild(upArrow)
            
            let downArrow = SKLabelNode(fontNamed: "Arial")
            downArrow.text = "↓"
            downArrow.fontSize = 30
            downArrow.position = CGPoint(x: CGFloat(i * 100), y: 160)
            downArrow.name = "downArrow\(i)"
            addChild(downArrow)
        }
        
        // Adicione o botão de confirmação
        let confirmButton = SKLabelNode(fontNamed: "Arial")
        confirmButton.text = "Confirmar"
        confirmButton.fontSize = 30
        confirmButton.position = CGPoint(x: 150, y: 50)
        confirmButton.name = "confirmButton"
        addChild(confirmButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if node.name?.hasPrefix("upArrow") ?? false {
                if let index = Int(node.name!.replacingOccurrences(of: "upArrow", with: "")) {
                    rotatePasswordLetter(index: index, up: true)
                }
            } else if node.name?.hasPrefix("downArrow") ?? false {
                if let index = Int(node.name!.replacingOccurrences(of: "downArrow", with: "")) {
                    rotatePasswordLetter(index: index, up: false)
                }
            } else if node.name == "confirmButton" {
                // Adicione a lógica para verificar a senha e realizar a ação apropriada
                if checkPassword() {
                    print("Senha correta! Cofre aberto.")
                } else {
                    print("Senha incorreta. Tente novamente.")
                }
            }
        }
    }
    
    func rotatePasswordLetter(index: Int, up: Bool) {
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        // Verifica se o índice está dentro dos limites do alfabeto
        guard index >= 0 && index < password.count else {
            return
        }
        
        var currentIndex = alphabet.firstIndex(of: password[password.index(password.startIndex, offsetBy: index)])!

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
        let updatedPassword = password.prefix(index) + String(newChar) + password.suffix(from: password.index(password.startIndex, offsetBy: index + 1))
        password = String(updatedPassword)

        updatePasswordDisplay()
    }

    
    func updatePasswordDisplay() {
        for (index, char) in password.enumerated() {
            if let letterSlot = childNode(withName: "letterSlot\(index)") as? SKLabelNode {
                letterSlot.text = String(char)
            }
        }
    }
    
    func checkPassword() -> Bool {
        return password == "AAB" // Substitua "TARGET" pela senha desejada
    }
}

