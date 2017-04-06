//
//  SettingsViewController.swift
//  MusicNoteFlash
//
//  Created by Pienaar Anker on 2017/03/30.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

enum TimeSignature: String{
    case fourfour = "4/4"
    case threefour = "3/4"
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var stpTempo: UIStepper!
    @IBOutlet weak var segTimeSignature: UISegmentedControl!
    @IBOutlet weak var swMute: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDefaults()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.synchronize()
    }
    
    func applyDefaults(){
        let tem = UserDefaults.standard.double(forKey: Constants.Defaults.tempo)
        if tem != 0{
            lblTempo.text = "\(Int(tem))"
            stpTempo.value = tem
        }
        
        if let ts = UserDefaults.standard.object(forKey: Constants.Defaults.timeSig) as? String,
            let enumTs = TimeSignature(rawValue: ts){
            switch enumTs {
            case .fourfour:
                segTimeSignature.selectedSegmentIndex = 0
            case .threefour:
                segTimeSignature.selectedSegmentIndex = 1
            }
        }
        
        swMute.isOn = UserDefaults.standard.bool(forKey: Constants.Defaults.muted)
    }
    
    @IBAction func ChangedTempo(_ sender: UIStepper) {
        lblTempo.text = "\(Int(sender.value))"
        Controller.instance.tempo = sender.value
        UserDefaults.standard.set(sender.value, forKey: Constants.Defaults.tempo)
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
        UserDefaults.standard.set(Controller.instance.timeSignature.rawValue, forKey: Constants.Defaults.timeSig)
    }
    @IBAction func ChangedMute(_ sender: UISwitch) {
        Controller.instance.muted = sender.isOn
        UserDefaults.standard.set(sender.isOn, forKey: Constants.Defaults.muted)
    }
}
