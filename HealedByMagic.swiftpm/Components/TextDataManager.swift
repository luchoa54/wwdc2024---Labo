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

//TODO: Traduzir para inglês
struct TextDataManager {
    var text: String
    var emotion: cientistEmotion
    
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
    
    public static var potionDone : [TextDataManager] = [
        .init(text: "Você conseguiu! Essa poção será distribuida imediatamente após os nossos testes!", emotion: .determined),
        .init(text: "Ah não! A poção funcionou em perte dos pacientes, mas em outra não surtiu efeito algum! Será que o efeito teve um efeito diferente neles?", emotion: .determined),
        .init(text: "Consegui o DNA desses pacientes, tente fazer outra poção imediatamente!", emotion: .determined)
    ]
    
    public static var experimentDone : [TextDataManager] = [
        .init(text: "Senhor, percebeu uma coisa?", emotion: .determined),
        .init(text: "Essas poções parecem muito com uma coisa...", emotion: .confused),
        .init(text: "VACINAS!", emotion: .determined),
        .init(text: "Este cenário que parece bobo retrata uma parte crucial de como esses pequenos frascos mantêm toda a humanidade segura contra várias doenças!", emotion: .determined),
        .init(text: "Demorou um pouco para decifrar os DNAs, não é? Na vida real, é semelhante! As vacinas levam tempo devido ao trabalho árduo de compreender o vírus-alvo...", emotion: .determined),
        .init(text: "... e encontrar os antígenos eficazes para desenvolver a cadeia de RNA correta, permitindo que nosso próprio corpo construa nossa defesa!", emotion: .determined),
        .init(text: "É claro que existem outras etapas na produção de vacinas por RNA, como testes e produção em massa. No entanto, é fascinante como essas cadeias são fundamentais para proteger todas as pessoas ao nosso redor!", emotion: .happy),
        .init(text: "Muito obrigado por compartilhar essa experiência comigo! E lembre-se: Vacinas não apenas salvam vidas, mas também representam uma conquista da ciência que nos conecta e protege coletivamente", emotion: .happy)

    ]

    
}


