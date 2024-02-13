//
//  File.swift
//
//
//  Created by Luciano Uchoa on 13/02/24.
//

import SpriteKit

class LaboratoryScene: SKScene {
    
    private var cameraNode : SKCameraNode!
    var middleWidth: CGFloat = 0.0
    var middleHeight: CGFloat = 0.0
    
    var interactionIndex: Int = 0 {
        didSet {
            updateButtonVisibility()
        }
    }
    
    class func newScene() -> LaboratoryScene {
        let scene = LaboratoryScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        middleWidth = view.bounds.width / 2
        middleHeight = view.bounds.height / 2
        
        setupExperiments()
        setupCamera()
        setupUI()
        
        print(middleWidth)
    }
    
    private func setupCamera() {
        cameraNode = SKCameraNode()
        cameraNode.position = CGPoint(x: middleWidth, y: 300)
        self.addChild(cameraNode)
        
        self.camera = cameraNode
    }
    
    private func setupExperiments() {
        
        //Assistant node
        let assistantNode = SKShapeNode(circleOfRadius: 50)
        assistantNode.fillColor = .systemPink
        assistantNode.position = CGPoint(x: middleWidth - (middleWidth - 200), y: 300)
        self.addChild(assistantNode)
        
        //Experimento 1
        let firstExpNode = SKShapeNode(circleOfRadius: 50)
        firstExpNode.fillColor = .red
        firstExpNode.position = CGPoint(x: middleWidth, y: 300)
        self.addChild(firstExpNode)
        
        //Experimento 2
        let secondExpNode = SKShapeNode(circleOfRadius: 50)
        secondExpNode.fillColor = .blue
        secondExpNode.position = CGPoint(x: middleWidth * 2, y: 300)
        self.addChild(secondExpNode)
        
        //Experimento 3
        let thirdExpNode = SKShapeNode(circleOfRadius: 50)
        thirdExpNode.fillColor = .green
        thirdExpNode.position = CGPoint(x: middleWidth * 3, y: 300)
        self.addChild(thirdExpNode)
    }
    
    private func setupUI() {
        let moveRightButton = ButtonNode(buttonType: .play, action: {
            self.moveCamera(by: CGVector(dx: self.middleWidth, dy: 0), duration: 0.5)
            self.interactionIndex += 1
        })
        moveRightButton.position = CGPoint(x: 500, y: 0)
        
        let moveLeftButton = ButtonNode(buttonType: .play, action: {
            self.moveCamera(by: CGVector(dx: -self.middleWidth, dy: 0), duration: 0.5)
            self.interactionIndex -= 1
        })
        moveLeftButton.position = CGPoint(x: -500, y: 0)
        
        cameraNode.addChild(moveRightButton)
        cameraNode.addChild(moveLeftButton)
        
        updateButtonVisibility()
    }
    
    private func moveCamera(by vector: CGVector, duration: TimeInterval) {
        let moveAction = SKAction.move(by: vector, duration: duration)
        moveAction.timingMode = .easeInEaseOut
        cameraNode.run(moveAction)
    }
    
    
    private func updateButtonVisibility() {
        if let camera = self.camera {
            for case let buttonNode as ButtonNode in camera.children {
                if buttonNode.position.x < 0 {
                    buttonNode.isHidden = interactionIndex == 0
                } else {
                    buttonNode.isHidden = interactionIndex == 2
                }
            }
        }
    }
}

