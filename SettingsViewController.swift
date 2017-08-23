//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Richard Kho on 8/23/17.
//  Copyright © 2017 Richard Kho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet weak var enableSplitTabs: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tipValue = defaults.integer(forKey: "defaultTipIndex")
        let splitTabsEnabled = defaults.bool(forKey: "enableSplitTabs")
        
        defaultTip.selectedSegmentIndex = tipValue
        
        enableSplitTabs.setOn(splitTabsEnabled, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipValueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }

    @IBAction func enableSplitTabsValueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(enableSplitTabs.isOn, forKey: "enableSplitTabs")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
