//
// Created by Pienaar Anker on 2017/04/03.
// Copyright (c) 2017 Byte Orbit. All rights reserved.
//

import Foundation

class Key{
    var key: String
    var keySet: [String]

    init(key: String, keySet: [String]){
        self.key = key
        self.keySet = keySet
    }

    func shuffleKeys(){
        keySet.shuffle()
    }
}

class KeyController {

    init() {}

    private let majorKeys = [
            Key(key: "A", keySet: keyA),
            Key(key: "B♭", keySet: keyBb),
            Key(key: "B", keySet: keyB),
            Key(key: "C", keySet: keyC),
            Key(key: "C#", keySet: keyCsh),
            Key(key: "D", keySet: keyD),
            Key(key: "D#", keySet: keyDsh),
            Key(key: "E", keySet: keyE),
            Key(key: "F", keySet: keyF),
            Key(key: "F#", keySet: keyFsh),
            Key(key: "G", keySet: keyG),
            Key(key: "G#", keySet: keyGsh)
    ]

    static let keyA = ["A","Bm","C#m","D","E","F#m","G#dim"]
    static let keyBb = ["B♭","Cm","Dm","E♭","F","Gm","Adim"]
    static let keyB = ["B","C#m","D#m","E","F#","G#m","A#dim"]
    static let keyC = ["C","Dm","Em","F","G","A","Bdim"]
    static let keyCsh = ["C#","D#m","Fm","G♭","A♭","B♭m","Cdim"]
    static let keyD = ["D","Em","F#m","G","A","Em","C#dim"]
    static let keyDsh = ["D#","Fm","Gm","A♭","B♭","Cm","Ddim"]
    static let keyE = ["E","F#m","G#m","A","B","C#m","D#dim"]
    static let keyF = ["F","Gm","Am","b♭","C","Dm","Edim"]
    static let keyFsh = ["F#","G#m","A#m","B","Db","E♭m","Fdim"]
    static let keyG = ["G","Am","Bm","C","D","Em","F#dim"]
    static let keyGsh = ["G#","B♭m","Cm","D♭","E♭","Fm","G#dim"]

    func getKey(for keyString: String) -> Key?{
        let key = majorKeys.filter({$0.key == keyString});
        return key.first
    }

    func getMajorKeys() -> [Key] {
        return majorKeys
    }
}
