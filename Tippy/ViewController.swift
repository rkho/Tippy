//
//  ViewController.swift
//  Tippy
//
//  Created by Richard Kho on 8/11/17.
//  Copyright © 2017 Richard Kho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear (_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        let defaults = UserDefaults.standard

        tipAmount.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipAmount.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
    @IBAction func handleRightSwipe(_ sender: Any) {
        print("RIGHT")
    }
    
    @IBAction func handleLeftSwipe(_ sender: Any) {
        print("LEFT")
    }
    
    @IBAction func tipValueChanged(_ sender: Any) {
        calculateTip(1)
    }
}

