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
    var anotherArrayValues = ["Karry", "Karen", "Elai", "Den"]
    
    var pickerValue: String?
    var anotherPickerValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // to set the desired normal & expanded cell height
        TableCellPicker.normalHeight = 40
        TableCellPicker.expandedHeight = 201
        
        // to set the picker view properties
        TableCellPicker.setPickerBackgroundColor = UIColor.clearColor()
        TableCellPicker.setPickerFontStyle = UIFont(name: "Chalkduster", size: 15)!
        TableCellPicker.setPickerTextColor = UIColor.blueColor()
        TableCellPicker.setPickerTextAlignment = NSTextAlignment.Center
        
        // register the nib of the custom cell first
        let nibBundle = NSBundle(forClass: TableCellPicker.self)
        let cellNib = UINib(nibName: CELL_ID, bundle: nibBundle)
        tblView.registerNib(cellNib, forCellReuseIdentifier: CELL_ID )

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // get the height for specific index path
        return TableCellPicker.fetchCellHeight(indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as! TableCellPicker
        cell.selectionStyle = .None
        
        if indexPath.row == 0 || indexPath.row == 1 {
            cell.delegate = self
            
            if indexPath.row == 0 {
                cell.pickerView.tag = indexPath.row
                cell.pickerItems = arrayValues
                
                cell.label.text = "Status:"
                cell.setLabelProperty(UIColor.blackColor(), textFontStyle: UIFont(name: "Arial", size: 15)!, textBackgroundColor: UIColor.clearColor(), textAlignment: NSTextAlignment.Left)
                
                cell.textLbl.text = pickerValue
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
        
        cell.currentItem = cell.textLbl.text
        cell.pickerView.reloadAllComponents()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // set the selected index path
        TableCellPicker.selectedIndexPath = indexPath
        
        // reload the specific index path
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    // MARK: - PickerTableViewCell Delegate
    
    func updatePicker(pickerTag: Int, row: Int) {
        if pickerTag == 0 {
            pickerValue = arrayValues[row]
        }
        else if pickerTag == 1 {
            anotherPickerValue = anotherArrayValues[row]
        }
        
        tblView.reloadData()
    }
    
}

