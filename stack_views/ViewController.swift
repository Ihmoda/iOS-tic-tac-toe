//
//  ViewController.swift
//  stack_views
//
//  Created by Omar Ihmoda on 1/10/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var myButtons: [UIButton]!
    
    var turn: String = "Red"
    var game_over = false
    var tic_tac_array = ["empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.winnerLabel.isHidden = true
        self.resetButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if self.game_over == false{
            let idx = sender.tag-1
            if self.turn != "Green" {
                self.tic_tac_array[idx] = "Red"
                sender.backgroundColor = .red
                self.turn = "Green"
            } else {
                self.tic_tac_array[idx] = "Green"
                sender.backgroundColor = .green
                self.turn = "Red"
            }
            self.checkpairs()
        }
    
    }
        
    func checkpairs(){
        
        //variable holding index pos of all winning combos
        let checks = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6],
        ]
        
        for match in checks {
            if self.tic_tac_array[match[0]] == self.tic_tac_array[match[1]] && self.tic_tac_array[match[1]] == self.tic_tac_array[match[2]] && self.tic_tac_array[match[0]] != "empty" {
                self.winnerLabel.text = "Congrats! \(self.tic_tac_array[match[0]]) Won!"
                self.winnerLabel.isHidden = false
                self.resetButton.isHidden = false
                self.game_over = true
            }
            
            if self.tic_tac_array.contains("empty") == false {
                self.winnerLabel.text = "Draw! Reset to play again."
                self.winnerLabel.isHidden = false
                self.resetButton.isHidden = false
                self.game_over = true
            }
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.reset()
    }
    
    func reset(){
        for idx in 0..<self.tic_tac_array.count{
            self.tic_tac_array[idx] = "empty"
        }
        for button in self.myButtons {
            button.backgroundColor = UIColor.darkGray
        }
        self.winnerLabel.isHidden = true
        self.resetButton.isHidden = true
        self.game_over = false
        self.turn = "Red"
    }
    
}

