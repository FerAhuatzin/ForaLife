//
//  SessionManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 22/06/23.
//

import Foundation

class SessionManager {
    func compareProfile (username: String, password: String) -> Bool{
        //Comparar si en base de datos o estructura que usemos existe tal busqueda que la username y password que se den coincidan con algun registro
        var existingProfile: Bool = false
        if username=="Fernando" && password == "Ceviche03" { //cambiar por hacer busqueda de registros y si existe uno con esos datos entonces entra al if
            existingProfile = true
        }
        return existingProfile
    }
    
    func comparePassword (password: String, verifiedPassword: String) -> Bool {
        if password==verifiedPassword {
            return true
        }
        return false
    }
    
    func checkValidInput (username: String, password: String, verifiedPassword: String, university: String, street: String, number: String, city: String, zip: String) -> [Int]{
    var dataIndexes: [Int] = []
        if username == "" {
            dataIndexes.append(0)
        }
        if password == "" {
            dataIndexes.append(1)
        }
        if verifiedPassword == "" {
            dataIndexes.append(2)
        }
        if university == "" {
            dataIndexes.append(3)
        }
        if street == "" {
            dataIndexes.append(4)
        }
        if number == "" {
            dataIndexes.append(5)
        }
        if city == "" {
            dataIndexes.append(6)
        }
        if zip == "" {
            dataIndexes.append(7)
        }
        return dataIndexes
    }
}
