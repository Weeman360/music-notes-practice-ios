//
//  Controller.swift
//  MusicNoteFlash
//
//  Created by Pienaar Anker on 2017/03/30.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit


class Controller: NSObject {
    static let instance = Controller()
    
    var tempo: Double = 120.0
    var timeSignature = TimeSignature.fourfour
    var muted = false
    
    func configureDefaults(){
        let tem = UserDefaults.standard.double(forKey: Constants.Defaults.tempo)
        if tem != 0{
            tempo = tem
        }
        
        muted = UserDefaults.standard.bool(forKey: Constants.Defaults.muted)
        
        if let ts = UserDefaults.standard.object(forKey: Constants.Defaults.timeSig) as? String,
            let enumTs = TimeSignature(rawValue: ts){
            timeSignature = enumTs
        }
    }
    
    func getFrequency() -> TimeInterval{
        return 60 / tempo
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }

        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

