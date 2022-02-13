//
//  OtherUserService.swift
//  TinderCloneApp
//
//  Created by Paolo Prodossimo Lopes on 07/10/21.
//

import Foundation

final class OtherUserService {
    
    //MARK: - Properties
    static let shared: OtherUserService = OtherUserService()
    
    //MARK: - LifeCycle
    
    private init() {}
    
    //MARK: - Helpers
    
    func fetchOtherUser(completion: @escaping (([OtherUser]?, Error?) -> ())) {
        let otherUsers: [OtherUser] = [
            OtherUser(id: 101, name: "Maria Silva", age: 19, match: true, phase: "O último a dar match chama", photo: "pessoa-1"),
            OtherUser(id: 102, name: "Debora Lima", age: 25, match: false, phase: "Deu like sem querer?", photo: "pessoa-2"),
            OtherUser(id: 103, name: "Sandra Souza", age: 24, match: false, phase: "Acho q a gente combina", photo: "pessoa-3"),
            OtherUser(id: 104, name: "Anna Beatriz", age: 22, match: true, phase: "Não bebo não fumo e não curto balada", photo: "pessoa-4"),
            OtherUser(id: 105, name: "Laura Oliveira", age: 26, match: true, phase: "Quer saber mais sobre mim?", photo: "pessoa-5"),
            OtherUser(id: 106, name: "Silva Paz", age: 19, match: false, phase: "Se não for conversar nem dá like", photo: "pessoa-6"),
            OtherUser(id: 107, name: "Debora Lima", age: 25, match: false, phase: "Em busca de novas amizades", photo: "pessoa-7"),
            OtherUser(id: 108, name: "Sandra Souza", age: 24, match: true, phase: "Fotos sem camisa não me impressionam", photo: "pessoa-8"),
            OtherUser(id: 109, name: "Tah Beatriz", age: 22, match: false, phase: "Oi pelo visto a gente combina", photo: "pessoa-9"),
            OtherUser(id: 110, name: "Laura Oliveira", age: 26, match: true, phase: "Procurando um bom papo", photo: "pessoa-10"),
            OtherUser(id: 111, name: "Sabrina Santos", age: 21, match: false, phase: "Quem se descreve se limita", photo: "pessoa-11"),
            OtherUser(id: 112, name: "Amelia Margaret", age: 30, match: false, phase: "Não quero nada casual", photo: "pessoa-12"),
            OtherUser(id: 113, name: "Laura Komako", age: 26, match: true, phase: "Bom humor é fundamental", photo: "pessoa-13"),
            OtherUser(id: 114, name: "Rosa Oliveira", age: 25, match: false, phase: "Não sei me descrever", photo: "pessoa-14"),
            OtherUser(id: 115, name: "Nadia Joana", age: 20, match: false, phase: "Quer saber mais? é só dar like", photo: "pessoa-15"),
            OtherUser(id: 116, name: "Mary Dandara", age: 20, match: false, phase: "Tenho um relacionamento aberto", photo: "pessoa-16"),
            OtherUser(id: 117, name: "Anita Eleanor", age: 23, match: false, phase: "Bonita demais pra ser verdade", photo: "pessoa-17"),
            OtherUser(id: 118, name: "Helen Aung San", age: 24, match: true, phase: "Espero q vc seja mente aberta", photo: "pessoa-18"),
            OtherUser(id: 119, name: "Laura Nelle", age: 18, match: false, phase: "Estou aqui para fazer novas amizades", photo: "pessoa-19"),
            OtherUser(id: 120, name: "Maria Virginia", age: 18, match: false, phase: "Adoro balada", photo: "pessoa-20")
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(otherUsers, nil)
        }
    }
    
}
