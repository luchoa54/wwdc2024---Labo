//
//  File.swift
//  
//
//  Created by Luciano Uchoa on 23/02/24.
//

import SpriteKit

public extension Array where Element == SKTexture {
    init (withFormat format: String, range: ClosedRange<Int>) {
        self = range.map({ (index) in
            let imageNamed = String(
                format: format, "\(index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}


extension SKAction {
    public static func createBluePotion() -> SKAction {
        return .animate(with: .init(withFormat: "machine%@", range: 0...8), timePerFrame: 0.2)
    }
    
    public static func createPurplePotion() -> SKAction {
        return .animate(with: .init(withFormat: "machine%@", range: 9...18), timePerFrame: 0.2)
    }
}
