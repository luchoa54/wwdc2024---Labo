//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 13/02/24.
//

import Foundation

class GameController {
    
    static var shared: GameController = {
        return GameController()
    }()
    
    var initialScene: LaboratoryScene {
        .newScene()
    }
    
    var stepsPassed: Int = 0
}
