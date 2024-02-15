//
//  TextDataManager.swift
//
//
//  Created by Luciano Uchoa on 14/02/24.
//

import Foundation
import SwiftUI

enum cientistEmotion: String {
    case happy = "happy"
    case confused = "confused"
    case determined = "determined"
    case scared = "scared"
}

enum charTalkin: String {
    case cientist = "cientist"
    case player = ""
}

struct TextDataManager {
    var text: String
    var emotion: cientistEmotion
    
    public static var worldDoomedDialog : [TextDataManager] = [
        .init(text: "O Catalisador Genético é uma peça antiga, intricadamente esculpida e enfeitada com runas mágicas. Possui compartimentos para inserir ingredientes mágicos, como a cadeia de DNA do monstro. Ao ativar o catalisador com gestos mágicos, ele canaliza a energia mística para transformar os componentes em uma poção, enquanto exibe uma projeção holográfica que mostra a manipulação mágica da sequência genética.", emotion: .scared),
        .init(text: "confused", emotion: .confused),
        .init(text: "determined", emotion: .determined)
    ]
    
    public static var worldIntroduction : [TextDataManager] = [
        .init(text: "Ei você, preciso da sua ajuda! Um mágico maluco espalhou um encantamento por todo o mundo que está transformando as pessoas em monstros!", emotion: .scared),
        .init(text: "Depois de me acalmar e analisar alguns pacientes, tenho a impressão de que a transformação das pessoas em monstros está relacionada a uma alteração genética específica", emotion: .determined),
        .init(text: "Precisamos logo tentar criar uma cura para todo esse caos! Vamos ao trabalho!", emotion: .determined)
    ]
    
    public static var potionIntroduction : [TextDataManager] = [
        .init(text: "Essa é a máquina de criação de poções! Com as amostras de DNA dos pacientes monstrificados que consegui, podemos criar poções para reverter o efeito do feitiço", emotion: .determined),
        .init(text: "Você só precisa colocar o código mRNA equivalente a essa cadeia de DNA que está aparecendo e começar o processo de criação", emotion: .determined),
        .init(text: "Eu tenho a regra de transcrição aqui em algum lugar, mas você já pode começar o processo", emotion: .scared)
    ]

    
}


