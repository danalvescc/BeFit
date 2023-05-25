//
//  FirestoneService.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 20/05/23.
//

import FirebaseCore
import FirebaseFirestore

let db = Firestore.firestore()

class FirestoreService {
    static let shared = FirestoreService()
    private let db = Firestore.firestore()
    
    func addUser(data: [String: Any]) {
        let documentReference = db.collection("Users").document(getEmail(data))
        documentReference.setData(data) { error in
            if let error = error {
                print("Erro ao salvar os dados no Firestore: \(error)")
            } else {
                print("Dados salvos com sucesso no Firestore. DocumentID: \(documentReference.documentID)")
            }
        }
    }
    
    func updateUser(data: [String: Any], id: String) {
        db.collection("Users").document(id).setData(data) { error in
            if let error = error {
                print("Erro ao atualizar os dados no Firestore: \(error)")
            } else {
                print("Dados atualizados com sucesso no Firestore.")
            }
        }
    }
    
    private func getEmail(_ data: [String: Any]) -> String {
        if let personalData = data["personalData"] as? [String: Any],
           let email = personalData["email"] as? String {
            return email
        } else {
            return "Unknown"
        }
    }
}
