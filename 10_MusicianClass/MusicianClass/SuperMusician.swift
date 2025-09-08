//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Bora Aksoy on 14.12.2024.
//

import Foundation

//Musician sınıfından kalıtım alan yeni bir class.
class SuperMusician : Musicians {
    override func sing() {
        super.sing()
        print("Yanlız ölmezmiş naber?")
    }
}
