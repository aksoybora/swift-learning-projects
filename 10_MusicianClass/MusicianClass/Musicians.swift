//
//  Musicians.swift
//  MusicianClass
//
//  Created by Bora Aksoy on 14.12.2024.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violinest
    case Guitarist
}

class Musicians {
    
    //Properties
    var name: String
    var age: Int
    var instrument: String
    var type: MusicianType
    
    //Initialazier (Constructor) : Sınıf oluşturulduğunda ne yapacağını gösterir.
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing(){
        print("İnsan yalnız doğar da...")
    }
}
