//
//  Sounds.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/16.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit
import AudioToolbox

class Sounds: NSObject {

    static let instance = Sounds()
    fileprivate var innerTick: SystemSoundID = 0
    fileprivate var leadTick: SystemSoundID = 0
    
    override init() {
        super.init()
        
        AudioServicesCreateSystemSoundID(urlForSound("inner-tick", type: "wav") as CFURL, &innerTick)
        AudioServicesCreateSystemSoundID(urlForSound("lead-tick", type: "wav") as CFURL, &leadTick)
    }
    
    fileprivate func urlForSound(_ name: String, type: String) -> URL{
        let soundPath = Bundle.main.path(forResource: name, ofType: type)
        let soundURL = URL(fileURLWithPath: soundPath!)
        return soundURL
    }
    
    func playInnerTick(){
        if !Controller.instance.muted{
            AudioServicesPlaySystemSound(innerTick)
        }
    }
    
    func playLeadTick(){
        if !Controller.instance.muted{
            AudioServicesPlaySystemSound(leadTick)
        }
    }
}
