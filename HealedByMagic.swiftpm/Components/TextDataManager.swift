//
//  TextDataManager.swift
//
//
//  Created by Luciano Uchoa on 14/02/24.
//

import Foundation
import SwiftUI
import UIKit

enum cientistEmotion: String {
    case happy = "happy"
    case scared = "scared"
    case happy2 = "happy2"
    case scared2 = "scared2"
}

enum TextSection: String {
    case worldIntroduction
    case potionIntroduction
    case potionDone
    case experimentDone
    case finishExperience
}

struct CustomFont {
    func getFont(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url( forResource: "VT323-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)
        let font = Font.custom("VT323-Regular", size: size)
        return font
    }
}

struct TextDataManager {
    var text: String
    var emotion: cientistEmotion
    
    public static var worldIntroduction : [TextDataManager] = [
        .init(text: "Hey you, I need your help! A crazy magician has started releasing various ferocious monsters near the villages!", emotion: .scared),
        .init(text: "Several people are quarantined because of these monsters roaming around their homes!", emotion: .scared),
        .init(text: "I discovered that we can fight these monsters with magic potions that have genetic chains capable of defeating them!", emotion: .scared),
        .init(text: "We need to put an end to this chaos soon! Let's go to work!", emotion: .scared)
    ]
    
    public static var potionIntroduction : [TextDataManager] = [
        .init(text: "This is the potion creation machine! With the DNA samples from the monsters I obtained, we can create potions to combat their mutation and defend the village!", emotion: .happy),
        .init(text: "The RNA chain that we need to get is appearing at the top of the machine", emotion: .happy),
        .init(text: "You just need to put the DNA code equivalent to this mRNA chain that is appearing and hit the confirm button to start the creation process", emotion: .happy),
        .init(text: "For example, if the code shown on the top of the machine is UAGCAAUCA, you must put ATCGTTAGT on the bottom of the machine to create the correct RNA strand!", emotion: .happy),
        .init(text: "Remember the rules of RNA transcription: \nT = A, A = U, C = G, G = C", emotion: .scared)
    ]
    
    public static var potionDone: [TextDataManager] = [
        .init(text: "You did it! This potion will be used immediately for our tests!", emotion: .happy)
    ]
    
    public static var potionProblem : [TextDataManager] = [
        .init(text: "Oh no! The potion worked on some of the monsters, but on others it had no effect at all! Why didn't it have any effect on them?", emotion: .scared),
        .init(text: "I got the DNA of these other monsters, try making another potion immediately!", emotion: .scared),
        .init(text: "Remembering that: \nT = A, A = U, C = G, G = C", emotion: .scared)
    ]
    
    public static var secondPotionDone: [TextDataManager] = [
        .init(text: "You did it! Let's get to the testing quickly!", emotion: .happy),
        .init(text: "Wonderful! We were able to fight all the monsters because of your potion!", emotion: .happy),
        .init(text: "Madam? What is happening? You look like you're going to black out...", emotion: .scared),
    ]
    
    public static var experimentDone : [TextDataManager] = [
        .init(text: "Doctor Jaqueline?", emotion: .scared2),
        .init(text: "You finally woke up, what happened?", emotion: .scared2),
        .init(text: "Monsters, magic potions? what are these letters written here?", emotion: .scared2),
        .init(text: "Wait, that's it! All these chains are what we need to be able to decode the virus genome!", emotion: .happy2),
        .init(text: "With its discovery, our body now has the necessary instructions to create its own defense against the virus!", emotion: .happy2),
        .init(text: "It's incredible that you managed to solve this mystery in just 48 hours! We finally have an effective vaccine!", emotion: .happy2),
        .init(text: "Now we can create more (\")magic potions(\")! Let's start the vaccine's test phase!", emotion: .happy2)
    ]

    public static var finishExperience : [TextDataManager] = [
        .init(text: "This experience was designed to share a little of the story of Dr. Jaqueline Goes de Jesus!", emotion: .happy2),
        .init(text: "She is a biomedical doctor, PhD in human pathology and Brazilian researcher!", emotion: .happy2),
        .init(text: "And the main coordinator of the team responsible for sequencing the genome of the SARS-CoV-2 virus 48 hours after the first case of the disease in Brazil!", emotion: .happy2),
        .init(text: "Her work and that of so many other researchers helped save so many lives during these difficult times that humanity went through!", emotion: .happy2),
        .init(text: "This figurative scenario was created to imagine how difficult the process she went through to create the vaccines was!", emotion: .happy2),
        .init(text: "Thank you very much for sharing this experience with me! And remember: Vaccines not only save lives, but they also represent an achievement of science that connects and protects us collectively!", emotion: .happy2)
    ]
    
}


