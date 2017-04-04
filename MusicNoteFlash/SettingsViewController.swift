//
//  SettingsViewController.swift
//  MusicNoteFlash
//
//  Created by Pienaar Anker on 2017/03/30.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

enum TimeSignature{
    case fourfour
    case threefour
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTempo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func ChangedTime(_ sender: UIStepper) {
        lblTime.text = "\(Int(sender.value))"
        Controller.instance.frequency = sender.value
    }
    
    @IBAction func ChangedTempo(_ sender: UIStepper) {
        lblTempo.text = "\(Int(sender.value))"
        Controller.instance.tempo = Int(sender.value)
    }
    
    @IBAction func ChangedTimeSignature(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Controller.instance.timeSignature = .fourfour
        case 1:
            Controller.instance.timeSignature = .threefour
        default:
            break
        }
    }
}
