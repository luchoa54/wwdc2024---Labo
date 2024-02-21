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

enum TextSection: String {
    case worldIntroduction
    case potionIntroduction
    case potionDone
    case experimentDone
    case finishExperience
}

//TODO: Traduzir para inglês
struct TextDataManager {
    var text: String
    var emotion: cientistEmotion
    
    public static var worldIntroduction : [TextDataManager] = [
        .init(text: "Ei você, preciso da sua ajuda! Um mágico maluco começou a soltar vários monstros ferozes perto das vilas!", emotion: .scared),
        .init(text: "Descobri que podemos combater esses monstros com poções mágicas para ajudar os nossos combatentes a derrotarem esses monstros!", emotion: .determined),
        .init(text: "Precisamos logo dar um fim a esse caos! Vamos ao trabalho!", emotion: .determined)
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
        .init(text: "Senhora Jaqueline?", emotion: .determined),
        .init(text: "Você finalmente acordou, o que aconteceu?", emotion: .confused),
        .init(text: "Monstros, poções mágicas? o que são essas letras escritas aqui?", emotion: .determined),
        .init(text: "Pera, é isso! Todas essas cadeias são o que nós precisamos para conseguir decodificar o genoma do vírus!", emotion: .determined),
        .init(text: "É incrível que a senhora conseguiu desvendar esse mistério em somente 48 horas!", emotion: .determined),
        .init(text: "Agora podemos criar (\")poções mágicas(\") que vão ajudar o nosso corpo a criar defensores contra a doença! Vamos começar os testes da vacina!", emotion: .determined)
    ]

    public static var finishExperience : [TextDataManager] = [
        .init(text: "Essa experiência foi feita para compartilhar um pouco da história da doutora Jaqueline Goes de Jesus!", emotion: .determined),
        .init(text: "Ela foi a principal coordenadora da equipe responsável pelo sequenciamento do genoma do vírus SARS-CoV-2 após 48 horas após o primeiro caso da doença no Brasil!", emotion: .happy),
        .init(text: "O trabalho dela e de tantos outros pesquisadores ajudaram a salvar tantas vidas durante esses tempos difícies que a humanidade passou!", emotion: .happy),
        .init(text: "Muito obrigado por compartilhar essa experiência comigo! E lembre-se: Vacinas não apenas salvam vidas, mas também representam uma conquista da ciência que nos conecta e protege coletivamente!", emotion: .happy)
    ]
    
}


