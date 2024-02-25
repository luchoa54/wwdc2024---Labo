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

//TODO: Traduzir para inglês
struct TextDataManager {
    var text: String
    var emotion: cientistEmotion
    
    public static var worldIntroduction : [TextDataManager] = [
        .init(text: "Ei você, preciso da sua ajuda! Um mágico maluco começou a soltar vários monstros ferozes perto das vilas!", emotion: .scared),
        .init(text: "Descobri que podemos combater esses monstros com poções mágicas para ajudar os nossos combatentes a derrotarem esses monstros!", emotion: .scared),
        .init(text: "Precisamos logo dar um fim a esse caos! Vamos ao trabalho!", emotion: .scared)
    ]
    
    public static var potionIntroduction : [TextDataManager] = [
        .init(text: "Essa é a máquina de criação de poções! Com as amostras de DNA dos  monstros que consegui, podemos criar poções para combater a mutação deles e defender a vila!", emotion: .happy),
        .init(text: "A cadeia de RNA que precisamos transcrever está aparecendo na parte de cima da máquina", emotion: .happy),
        .init(text: "Você só precisa colocar o código mRNA equivalente a essa cadeia de DNA que está aparecendo e começar o processo de criação", emotion: .happy),
        .init(text: "Por exemplo, se o código mostrado for UAGCAAUCA, você deve colocar ATCGTTAGT na máquina para criar a cadeia de RNA correta!", emotion: .happy),
        .init(text: "Lembre-se das regras de transcrição de RNA: \n T = A, A = U, C = G, G = C", emotion: .scared)
    ]
    
    public static var potionDone: [TextDataManager] = [
        .init(text: "Você conseguiu! Essa poção será distribuida imediatamente após os nossos testes!", emotion: .happy)
    ]
    
    public static var potionProblem : [TextDataManager] = [
        .init(text: "Ah não! A poção funcionou em perte dos pacientes, mas em outra não surtiu efeito algum! Será que o efeito teve um efeito diferente neles?", emotion: .scared),
        .init(text: "Consegui o DNA desses pacientes, tente fazer outra poção imediatamente!", emotion: .scared),
        .init(text: "Lembrando que: \n T = A, A = U, C = G, G = C", emotion: .scared)
    ]
    
    public static var secondPotionDone: [TextDataManager] = [
        .init(text: "Você conseguiu! Vamos rápido aos teste!", emotion: .happy),
        .init(text: "É isso! Conseguimos combater todos os monstros por causa da sua poção!", emotion: .happy),
        .init(text: "Senhora? O que está acontecendo? Você parece que vai apagar...", emotion: .scared),
    ]
    
    public static var experimentDone : [TextDataManager] = [
        .init(text: "Senhora Jaqueline?", emotion: .scared2),
        .init(text: "Você finalmente acordou, o que aconteceu?", emotion: .scared2),
        .init(text: "Monstros, poções mágicas? o que são essas letras escritas aqui?", emotion: .scared2),
        .init(text: "Pera, é isso! Todas essas cadeias são o que nós precisamos para conseguir decodificar o genoma do vírus!", emotion: .happy2),
        .init(text: "É incrível que a senhora conseguiu desvendar esse mistério em somente 48 horas!", emotion: .happy2),
        .init(text: "Agora podemos criar (\")poções mágicas(\") que vão ajudar o nosso corpo a criar defensores contra a doença! Vamos começar os testes da vacina!", emotion: .happy2)
    ]

    public static var finishExperience : [TextDataManager] = [
        .init(text: "Essa experiência foi feita para compartilhar um pouco da história da doutora Jaqueline Goes de Jesus!", emotion: .happy2),
        .init(text: "Ela foi a principal coordenadora da equipe responsável pelo sequenciamento do genoma do vírus SARS-CoV-2 após 48 horas após o primeiro caso da doença no Brasil!", emotion: .happy2),
        .init(text: "O trabalho dela e de tantos outros pesquisadores ajudaram a salvar tantas vidas durante esses tempos difícies que a humanidade passou!", emotion: .happy2),
        .init(text: "Muito obrigado por compartilhar essa experiência comigo! E lembre-se: Vacinas não apenas salvam vidas, mas também representam uma conquista da ciência que nos conecta e protege coletivamente!", emotion: .happy2)
    ]
    
}


