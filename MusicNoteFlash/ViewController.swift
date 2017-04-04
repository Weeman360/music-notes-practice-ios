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
    
    var timeLimit = 10.0
    var timeStarted: Date!
    var timer: Timer!
    var keyController = KeyController()
    var activeKey: Key!
    var keyIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       activeKey = keyController.getKey(for: "A")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        restart(with: activeKey.key)
    }
    
    func restart(with key: String){
        guard let key = keyController.getKey(for: key) else {return}
        let c = Controller.instance
        timeLimit = c.frequency
        key.shuffleKeys()
        updateKey(key: key.key)
        startNoteCycle(notes: key)
    }
    
    func startNoteCycle(notes: Key){
        if timer != nil { timer.invalidate() }
        timer = Timer.scheduledTimer(withTimeInterval: timeLimit, repeats: true) { _ in
            let count = notes.keySet.count
            self.timeStarted = Date()

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
        timer.fire()
        
        let timeKeeper = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ _ in
            self.updateTimeLeft(time: self.timeLimit + self.timeStarted.timeIntervalSinceNow)
        }
        timeKeeper.fire()
    }
    
    func updateTimeLeft(time: TimeInterval) {
        self.lblTime.text = "Time: \(Int(time))"
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

