//
//  ViewController.swift
//  TableCellPicker
//
//  Created by Oberes, Karry Raia C. on 10/15/2015.
//  Copyright (c) 2015 Oberes, Karry Raia C.. All rights reserved.
//

import UIKit
import TableCellPicker

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableCellPickerDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    
    let CELL_ID = "TableCellPicker"
    var arrayValues = ["New", "Finished", "Cancelled", "Rescheduled"]
    var anotherArrayValues = ["John", "Smith", "Juan", "dela Cruz"]
    
    var pickerValue: String?
    var anotherPickerValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // To set the desired normal & expanded cell height
        TableCellPicker.normalHeight = 40
        TableCellPicker.expandedHeight = 201
        
        // To set the picker view properties
        TableCellPicker.setPickerBackgroundColor = UIColor.clearColor()
        TableCellPicker.setPickerFontStyle = UIFont(name: "Chalkduster", size: 15)!
        TableCellPicker.setPickerTextColor = UIColor.blueColor()
        TableCellPicker.setPickerTextAlignment = NSTextAlignment.Center
        
        // To register the nib of the custom cell first
        let nibBundle = NSBundle(forClass: TableCellPicker.self)
        let cellNib = UINib(nibName: CELL_ID, bundle: nibBundle)
        tblView.registerNib(cellNib, forCellReuseIdentifier: CELL_ID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Get the height for specific index path
        return TableCellPicker.fetchCellHeight(indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as! TableCellPicker
        cell.selectionStyle = .None
        
        if indexPath.row == 0 || indexPath.row == 1 {
            cell.delegate = self
            
            // if-else condition for the row that will use a custom cell with the class TableCellPicker
            
            if indexPath.row == 0 {
                // Set the row where the pickerview is used
                cell.pickerView.tag = indexPath.row
                // Set the values to be used by the pickerview
                cell.pickerItems = arrayValues
                
                // Set the value for the title label
                cell.label.text = "Status:"
                // Set the custom properties for the title label
                cell.setLabelProperty(UIColor.blackColor(), textFontStyle: UIFont(name: "Arial", size: 15)!, textBackgroundColor: UIColor.clearColor(), textAlignment: NSTextAlignment.Left)
                
                // Set the value for the selected pickerview value label
                cell.textLbl.text = pickerValue
                // Set the custom properties for the selected pickerview value label
                cell.setTextLabelProperty(UIColor.blackColor(), textFontStyle: UIFont(name: "Arial", size: 15)!, textBackgroundColor: UIColor.clearColor(), textAlignment: NSTextAlignment.Left)
            }
            else if indexPath.row == 1 {
                cell.pickerView.tag = indexPath.row
                cell.pickerItems = anotherArrayValues
                
                cell.label.text = "Names:"
                cell.setLabelProperty(UIColor.blueColor(), textFontStyle: UIFont(name: "Avenir", size: 15)!, textBackgroundColor: UIColor.clearColor(), textAlignment: NSTextAlignment.Left)
                
                cell.textLbl.text = anotherPickerValue
                cell.setTextLabelProperty(UIColor.orangeColor(), textFontStyle: UIFont(name: "Avenir", size: 15)!, textBackgroundColor: UIColor.clearColor(), textAlignment: NSTextAlignment.Center)
            }
        }
        
        // Returns the selected value of the pickerview
        cell.currentItem = cell.textLbl.text
        cell.pickerView.reloadAllComponents()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Set the selected index path
        TableCellPicker.selectedIndexPath = indexPath
        
        // Reload the specific index path
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    // MARK: - PickerTableViewCell Delegate
    
    func updatePicker(pickerTag: Int, row: Int) {
        // Index = row where the pickerview is used
        
        if pickerTag == 0 {
            pickerValue = arrayValues[row]
        }
        else if pickerTag == 1 {
            anotherPickerValue = anotherArrayValues[row]
        }
        
        tblView.reloadData()
    }
    
}

