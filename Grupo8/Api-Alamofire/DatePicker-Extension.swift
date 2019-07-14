////
////  DatePicker-Extension.swift
////  Api-Alamofire
////
////  Created by markus corgosinho on 14/07/19.
////  Copyright © 2019 markus corgosinho. All rights reserved.
////
//
//import Foundation
//
//extension ViewController{
//    
//    func showDatePicker(){
//        //Formate Date
//        datePicker.datePickerMode = .date
//        
//        //ToolBar
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = editButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
//        let spaceButton = editButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = editButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
//        
//        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
//        
//        txtDatePicker.inputAccessoryView = toolbar
//        txtDatePicker.inputView = datePicker
//        
//    }
//    
//    @objc func donedatePicker(){
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        txtDatePicker.text = formatter.string(from: datePicker.date)
//        self.view.endEditing(true)
//    }
//    
//    @objc func cancelDatePicker(){
//        self.view.endEditing(true)
//    }
//}
//
