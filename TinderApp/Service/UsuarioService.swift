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
        Usuario(id: 104, nome: "Willian Dias", idade: 18, match: false, frase: "Adoro balada", foto: "pessoa-4"),
        Usuario(id: 105, nome: "Fernando", idade: 28, match: true, frase: "Adoro balada", foto: "pessoa-5"),
        Usuario(id: 106, nome: "Jefferson", idade: 18, match: false, frase: "Adoro balada", foto: "pessoa-6"),
        Usuario(id: 107, nome: "Andre", idade: 27, match: true, frase: "Adoro balada", foto: "pessoa-7"),
        Usuario(id: 108, nome: "Pedro", idade: 31, match: false, frase: "Adoro balada", foto: "pessoa-8"),
        Usuario(id: 109, nome: "João Henrique", idade: 22, match: false, frase: "Adoro balada", foto: "pessoa-9"),
        Usuario(id: 110, nome: "Guilherme", idade: 24, match: false, frase: "Adoro balada", foto: "pessoa-10"),
        Usuario(id: 111, nome: "Renato", idade: 28, match: false, frase: "Adoro balada", foto: "pessoa-11"),
        Usuario(id: 112, nome: "Pablo", idade: 25, match: true, frase: "Adoro balada", foto: "pessoa-12"),
        Usuario(id: 113, nome: "Henrique", idade: 23, match: true, frase: "Adoro balada", foto: "pessoa-13"),
        Usuario(id: 114, nome: "Casal Amizades", idade: 20, match: true, frase: "Adoro balada", foto: "pessoa-14"),
        Usuario(id: 115, nome: "Christiano", idade: 30, match: true, frase: "Adoro balada", foto: "pessoa-15"),
        Usuario(id: 116, nome: "Felipe Antunes", idade: 19, match: false, frase: "Adoro balada", foto: "pessoa-16")
    ]
    
    func buscaUsuarios (completion: @escaping ([Usuario]?, Error?) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            completion(self.usuarios, nil)
        }
        
    }
}
