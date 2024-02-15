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
    
//    var initialScene: FirstExperimentScene {
//        .newScene()
//    }
    
    var stepsPassed: Int = 0
    var firstExpCompleted: Bool = false
    var secondExpCompleted: Bool = false
    var thirdExpCompleted: Bool = false
}
