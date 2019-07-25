//
//  SecondViewController.swift
//  
//
//  Created by TYanna Morrison on 11/21/18.
//  Copyright © 2018 TYanna Morrison. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var locationPicker: UIPickerView!
    
    @IBOutlet weak var txt_pickUpData: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var buildings:[String] = ["Administration Building", "Architecture Building", "S.R.Collins Building", "ECE Building", "C.L. Willson / GilChrist Building", "Blackshear Stadium", "Memorial Student Center", "Science Building", "Recreation Center", "University Village", "University Village", "University Village", "Business / Agriculture", "Don K. CLark Building", "W.R.F Delco Building", "Jessie & Marry Jones Building", "ROTC & Music", "W.R. Bank Building", "Harrington Science Building", "Hilliard Hall Building", "G.R. Wollfolk Building", "Library Building", "Evens Hall", "Handerson Hall", "Leroy G. Moore Building"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
        
    }
    func pickUp(_ textField : UITextField){
    
    // UIPickerView
    self.locationPicker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
    self.locationPicker.delegate = self
    self.locationPicker.dataSource = self
    self.locationPicker.backgroundColor = UIColor.white
    textField.inputView = self.locationPicker
    
    // ToolBar
    let toolBar = UIToolbar()
    toolBar.barStyle = .default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
    toolBar.sizeToFit()
    
    // Adding Button ToolBar
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SecondViewController.doneClick))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SecondViewController.cancelClick))
    toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    textField.inputAccessoryView = toolBar
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buildings.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buildings[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txt_pickUpData.text = buildings[row]
    }
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(txt_pickUpData)
    }
    
    @objc func doneClick() {
        txt_pickUpData.resignFirstResponder()
    }
    @objc func cancelClick() {
        txt_pickUpData.resignFirstResponder()
    }
    
    @IBAction func addEventBtn(_ sender: Any) {
        let firstTab = self.tabBarController?.viewControllers?[0] as! FirstViewController
        if (dateLabel.text! == "" || txt_pickUpData.text! == "" || eventNameTextField.text! == "") {
            displayAlert(msgTitle: "Empty Field", msgContent: "")
            
        } else {
            firstTab.eventName.append(eventNameTextField.text!)
            firstTab.eventDate.append(dateLabel.text!)
            firstTab.eventLocation.append(txt_pickUpData.text!)
            displayAlert(msgTitle: "Event Added", msgContent: "")
            firstTab.myTableView.reloadData()
            
        }
    }
    
    
    
}
