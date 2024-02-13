//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 13/02/24.
//

import Foundation
import SpriteKit

enum ButtonType {
    case play, about, arrowRight, playAgain, menu
}

class ButtonNode: SKSpriteNode {
    
    let action: () -> Void
    
    init(buttonType: ButtonType, action : @escaping () -> Void){
        var texture : SKTexture
        
        switch buttonType {
            case .play :
                let buttonAnimation : [SKTexture] = [
                    SKTexture(imageNamed: "buttonPlay0"),
                    SKTexture(imageNamed: "buttonPlay1"),
                    SKTexture(imageNamed: "buttonPlay2")
                ]
                
                texture = buttonAnimation[0]
            case .about :
                
                let buttonAnimation : [SKTexture] = [
                    SKTexture(imageNamed: "buttonAbout0"),
                    SKTexture(imageNamed: "buttonAbout1"),
                    SKTexture(imageNamed: "buttonAbout2"),
                ]
                
                texture = buttonAnimation[0]
            case .arrowRight:
                let buttonAnimation : [SKTexture] = [
                    SKTexture(imageNamed: "arrow0"),
                    SKTexture(imageNamed: "arrow1"),
                    SKTexture(imageNamed: "arrow2"),
                ]
                
                texture = buttonAnimation[0]
            case .playAgain:
                let buttonAnimation : [SKTexture] = [
                    SKTexture(imageNamed: "buttonPlayAgain0"),
                    SKTexture(imageNamed: "buttonPlayAgain1"),
                    SKTexture(imageNamed: "buttonPlayAgain2"),
                ]
                
                texture = buttonAnimation[0]
            case .menu:
                let buttonAnimation : [SKTexture] = [
                    SKTexture(imageNamed: "menu0"),
                    SKTexture(imageNamed: "menu1"),
                    SKTexture(imageNamed: "menu2"),
                ]
                
                texture = buttonAnimation[0]
        }
        
        self.action = action
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action()
    }
}

