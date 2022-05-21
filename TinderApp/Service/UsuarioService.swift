//
//  UsuarioService.swift
//  TinderApp
//
//  Created by Brian Ail on 14/05/22.
//

import Foundation

class UsuarioService {
    
    static let shared = UsuarioService()
    
    let usuarios: [Usuario] = [
        Usuario(id: 101, nome: "Igor", idade: 18, match: true, frase: "Estou aqui para fazer novas amizades", foto: "pessoa-1"),
        Usuario(id: 102, nome: "Luiz Fernando", idade: 21, match: false, frase: "Tenho um relacionamento aberto", foto: "pessoa-2"),
        Usuario(id: 103, nome: "David 🏳️‍🌈", idade: 23, match: true, frase: "Quer saber mais? é só dar like", foto: "pessoa-3"),
        Usuario(id: 104, nome: "Willian Dias", idade: 18, match: false, frase: "Não tenho expectativas no Tinder… Vamos ver o que acontece!", foto: "pessoa-4"),
        Usuario(id: 105, nome: "Fernando", idade: 28, match: true, frase: "Busco afinidade, sintonia e a sinergia entre duas pessoas. Se isso faz sentido para você, continue.", foto: "pessoa-5"),
        Usuario(id: 106, nome: "Jefferson", idade: 18, match: false, frase: "Solteiro e a procura de mulheres interessantes.", foto: "pessoa-6"),
        Usuario(id: 107, nome: "Andre", idade: 27, match: true, frase: "Adepto à esportes, qualidade de vida, liberdade e amizade com pessoas positivas que buscam as mesmas coisas que eu procuro.", foto: "pessoa-7"),
        Usuario(id: 108, nome: "Pedro", idade: 31, match: false, frase: "Difícil falar de nós mesmos. Sou autêntico, cavalheiro, romântico, carinhoso, sempre muito sincero e simples. Adoro uma boa conversa, boa música e boa companhia.", foto: "pessoa-8"),
        Usuario(id: 109, nome: "João Henrique", idade: 22, match: false, frase: "Sou simpático, romântico, adoro cinema, sair à noite para dançar. Sou sincero e extrovertido. Se quiser conhecer mais de mim, já sabe", foto: "pessoa-9"),
        Usuario(id: 110, nome: "Guilherme", idade: 24, match: false, frase: "Adoro correr, conhecer novos lugares, e apreciar um delicioso café com amigos.", foto: "pessoa-10"),
        Usuario(id: 111, nome: "Renato", idade: 28, match: false, frase: "Tudo começa com uma boa conversa. O que está esperando?", foto: "pessoa-11"),
        Usuario(id: 112, nome: "Pablo", idade: 25, match: true, frase: "A vida está aí e passa muito depressa. Está a fim de viver? Vem comigo!", foto: "pessoa-12"),
        Usuario(id: 113, nome: "Henrique", idade: 23, match: true, frase: "Corrida, viagem, gastronomia, arte, botecos, amigos e gente bacana me interessa.", foto: "pessoa-13"),
        Usuario(id: 114, nome: "Casal Amizades", idade: 20, match: true, frase: "Somos bem tranquilos, sem vícios. Queremos novos horizontes sem brincadeiras ou aventuras.", foto: "pessoa-14"),
        Usuario(id: 115, nome: "Christiano", idade: 30, match: true, frase: "Solteiro sem filhos, não fumo. A procura de um amigo, se possível, que queira relacionamento sério.", foto: "pessoa-15"),
        Usuario(id: 116, nome: "Felipe Antunes", idade: 19, match: false, frase: "A vida está aí e passa muito depressa. Está a fim de viver? Vem comigo!", foto: "pessoa-16")
    ]
    
    func buscaUsuarios (completion: @escaping ([Usuario]?, Error?) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            completion(self.usuarios, nil)
        }
        
    }
}
