//
//  ViewController.swift
//  MusicNoteFlash
//
//  Created by Pienaar Anker on 2017/03/30.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblNextKey: UILabel!
    
    var timer: Timer!
    var keyController = KeyController()
    var activeKey: Key!
    var keyIndex = 0
    var timeCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Controller.instance.configureDefaults()
       activeKey = keyController.getKey(for: "A")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        restart(with: activeKey.key)
        updateTimeSignature()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil { timer.invalidate() }
    }
    
    func restart(with key: String){
        guard let key = keyController.getKey(for: key) else {return}
        timeCounter = 0
        key.shuffleKeys()
        updateKey(key: key.key)
        startNoteCycle(notes: key)
    }
    
    func startNoteCycle(notes: Key){
        if timer != nil { timer.invalidate() }
        let c = Controller.instance
        timer = Timer.scheduledTimer(withTimeInterval: c.getFrequency(), repeats: true) { _ in
            var nextNoteCount = 0
            switch c.timeSignature{
            case .fourfour:
                nextNoteCount = 4
            case .threefour:
                nextNoteCount = 3
            }
            
            if self.timeCounter >= nextNoteCount{
                Sounds.instance.playLeadTick()
                self.nextNote(notes: notes)
                self.timeCounter = 0
            }else{
                Sounds.instance.playInnerTick()
            }
            
            self.timeCounter += 1
        }
        timer.fire()
    }
    
    func nextNote(notes: Key){
        let count = notes.keySet.count
        
        if self.keyIndex >= count {
            self.keyIndex = 0
        }
        let note = notes.keySet[self.keyIndex]
        self.displayNote(note: note)
        
        if self.keyIndex + 1 >= count {
            notes.shuffleKeys()
        }
        let nextNoteIndex = self.keyIndex + 1 >= count ? 0 : self.keyIndex + 1
        self.displayNextNote(note: notes.keySet[nextNoteIndex])
        
        self.keyIndex += 1
    }
    
    func updateTimeSignature() {
        let tempo = Controller.instance.tempo
        let timeSig = Controller.instance.timeSignature
        self.lblTime.text = "♩: \(Int(tempo))\n\(timeSig.rawValue)"
    }
    
    func displayNote(note: String){
        self.lblNote.text = note
    }

    func displayNextNote(note: String){
        self.lblNextKey.text = "Next: \(note)"
    }

    func updateKey(key: String){
        self.lblKey.text = "Key: \(key)"
    }

    @IBAction func refresh(_ sender: Any) {
        restart(with: activeKey.key)
    }
    
    @IBAction func ChangedKey(_ sender: UIStepper) {
        let majorKeys = keyController.getMajorKeys()
        activeKey = majorKeys[Int(sender.value)]
        restart(with: activeKey.key)
    }
}

