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
    
    private let minorKeys = [
        Key(key: "Am", keySet: keyAm),
        Key(key: "B♭m", keySet: keyBbm),
        Key(key: "Bm", keySet: keyBm),
        Key(key: "Cm", keySet: keyCm),
        Key(key: "C#m", keySet: keyCshm),
        Key(key: "Dm", keySet: keyDm),
        Key(key: "D#m", keySet: keyDshm),
        Key(key: "Em", keySet: keyEm),
        Key(key: "Fm", keySet: keyFm),
        Key(key: "F#m", keySet: keyFshm),
        Key(key: "Gm", keySet: keyGm),
        Key(key: "G#m", keySet: keyGshm)
    ]

    // Major keys
    static let keyA = ["A","Bm","C#m","D","E","F#m","G#dim"]
    static let keyBb = ["B♭","Cm","Dm","E♭","F","Gm","Adim"]
    static let keyB = ["B","C#m","D#m","E","F#","G#m","A#dim"]
    static let keyC = ["C","Dm","Em","F","G","A","Bdim"]
    static let keyCsh = ["C#","D#m","Fm","G♭","A♭","B♭m","Cdim"]
    static let keyD = ["D","Em","F#m","G","A","Em","C#dim"]
    static let keyDsh = ["D#","Fm","Gm","A♭","B♭","Cm","Ddim"]
    static let keyE = ["E","F#m","G#m","A","B","C#m","D#dim"]
    static let keyF = ["F","Gm","Am","B♭","C","Dm","Edim"]
    static let keyFsh = ["F#","G#m","A#m","B","Db","E♭m","Fdim"]
    static let keyG = ["G","Am","Bm","C","D","Em","F#dim"]
    static let keyGsh = ["G#","B♭m","Cm","D♭","E♭","Fm","G#dim"]
    
    // Natural Minor keys
    static let keyAm = ["A","B","C","D","E","F","G"]
    static let keyBm = ["B","D♭","D","E","G♭","G","A"]
    static let keyBbm = ["B♭","C","D♭","E♭","F","G♭","A♭"]
    static let keyCm = ["C","D","E♭","F","G","A♭","B♭"]
    static let keyCshm = ["C#","D#","E","F#","G#","A","B"]
    static let keyDm = ["D","E","F","G","A","B♭","C"]
    static let keyDshm = ["D#","F","G♭","A♭","B♭","B","C#"]
    static let keyEm = ["E","F#","G","A","B","C","D"]
    static let keyFm = ["F","G","A♭","B♭","C","D♭","E♭"]
    static let keyFshm = ["F#","G#","A","B","C#","D","E"]
    static let keyGm = ["G","A","B♭","C","D","E♭","F"]
    static let keyGshm = ["G#","A#","B","C#","D#","E","F#"]

    func getKey(for keyString: String) -> Key?{
        let key = getAllKeys().filter({$0.key == keyString});
        return key.first
    }

    func getMajorKeys() -> [Key] {
        return majorKeys
    }
    
    func getMinorKeys() -> [Key]{
        return minorKeys
    }
    
    func getAllKeys() -> [Key]{
        var all = getMajorKeys()
        all.append(contentsOf: getMinorKeys())
        return all
    }
}
