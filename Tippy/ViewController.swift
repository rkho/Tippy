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
    @IBOutlet weak var splitLabel: UILabel!
    var numSplit :Int = 1
    var splitTabsEnabled :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear (_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard

        tipAmount.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
        splitTabsEnabled = defaults.bool(forKey: "enableSplitTabs")
        billField.text = defaults.string(forKey: "billAmount")
        
        if (!splitTabsEnabled) {
            numSplit = 1
            splitLabel.isHidden = true
        }
        
        calculateTip()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func billValueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "billAmount")
        
    
        calculateTip()
    }
    
    
    @IBAction func handleRightSwipe(_ sender: Any) {
        if (splitTabsEnabled) {
            numSplit += 1
            splitLabel.isHidden = false
            splitLabel.text = "Split between " + String(numSplit) + " people"
            calculateTip()
        }
    }
    
    @IBAction func handleLeftSwipe(_ sender: Any) {
        if (splitTabsEnabled && numSplit > 1) {
            numSplit -= 1
            
            if (numSplit == 1) {
                splitLabel.isHidden = true
            } else {
                splitLabel.text = "Split between " + String(numSplit) + " people"
            }

            calculateTip()
        }
    }
    
    @IBAction func tipValueChanged(_ sender: Any) {
        calculateTip()
    }
    
    func calculateTip () {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipAmount.selectedSegmentIndex]
        let total:Double = ((bill * tipPercentages[tipAmount.selectedSegmentIndex]) + bill) / Double(numSplit)
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

