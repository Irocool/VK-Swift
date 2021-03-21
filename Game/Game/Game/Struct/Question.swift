//
//  Question.swift
//  Game
//
//  Created by Пользователь on 19.02.2021.
//

import Foundation
struct Question {
    let id: Int
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}
class QuestionsStorage{
    static var shared = QuestionsStorage()
    private init(){}
    
    func getQuestion() -> [Question] {
        let question: [Question] = [
            Question(id: 1, text: "Зимой и летом одним цветом", answers: ["дуб", "береза", "ель", "грязь"], correctAnswerIndex: 3),
            Question(id: 2, text: "Мороз и солнце, день ..", answers: ["чудесный", "прелестный", "опасный", "прекрасный"], correctAnswerIndex: 1)
        ]
    return question
    
}

}
