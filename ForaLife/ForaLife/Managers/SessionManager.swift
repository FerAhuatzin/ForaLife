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
}
