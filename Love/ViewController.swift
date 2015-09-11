//
//  ViewController.swift
//  Love
//
//  Created by Cyrilshanway on 2015/9/11.
//  Copyright (c) 2015年 Cyrilshanway. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // AnyObject 就是 id的意思
    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider // 轉型的意思
        //height.text = "\(slider.value)cm"
        
        var number = Int(slider.value)
        slider.value = Float(number)
        height.text = "\(number)cm"
        
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "俊男" : "美女"
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) // 西曆
        let now        = NSDate()
        //let component  = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        
        let component = gregorian?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        let age = component?.year
        
        let hasPropertytext = hasProperty.on ? "有房" : "沒房"
        
        //result.text = "\(name.text), \(age)歲,\(genderText), 身高\(height.text), \(hasPropertytext), 求交往!"
        result.text = "\(name.text),\(age!)歲, \(genderText),身高\(height.text!), \(hasPropertytext),求交往！"
    }

    
    // UITextfield delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

