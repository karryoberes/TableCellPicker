//
//  TableCellPicker.swift
//  Pods
//
//  Created by Oberes, Karry Raia C. on 10/15/15.
//
//

import UIKit

public protocol TableCellPickerDelegate{
    func updatePicker(pickerTag: Int, row: Int)
}

public class TableCellPicker: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet public var pickerView: UIPickerView!
    @IBOutlet public var label: UILabel!
    @IBOutlet public var textLbl: UILabel!
    
    public var delegate: TableCellPickerDelegate?
    public var pickerItems: NSArray = []
    public var currentItem: String?
    
    public struct Variables {
        public static var selectedIndexPath:NSIndexPath? = NSIndexPath(forRow: -1, inSection: 0)
        public static var normalHeight: CGFloat = 0
        public static var expandedHeight: CGFloat = 0
        
        public static var pickerBackgroundColor : UIColor = UIColor.whiteColor()
        public static var pickerFontStyle : UIFont = UIFont(name: "Arial", size: 20)!
        public static var pickerTextColor : UIColor = UIColor.blackColor()
        public static var pickerTextAlignment : NSTextAlignment = NSTextAlignment.Center
    }
    
    public class var selectedIndexPath: NSIndexPath {
        get {
        return Variables.selectedIndexPath!
        }
        set {
            if newValue == Variables.selectedIndexPath {
                Variables.selectedIndexPath = NSIndexPath(forRow: -1, inSection: 0)
            } else {
                Variables.selectedIndexPath = newValue
            }
        }
    }
    
    public class var normalHeight: CGFloat {
        get {
        return Variables.normalHeight
        }
        set {
            Variables.normalHeight = newValue
        }
    }
    
    public class var expandedHeight: CGFloat {
        get {
        return Variables.expandedHeight
        }
        set {
            Variables.expandedHeight = newValue
        }
    }
    
    public class func fetchCellHeight(indexPath: NSIndexPath) -> CGFloat {
        if selectedIndexPath == indexPath {
            return Variables.expandedHeight
        }
        
        return Variables.normalHeight
    }
    
    
    // MARK: - CUSTOM PROPERTIES FOR PICKER VIEW
    
    public class var setPickerBackgroundColor: UIColor {
        get {
        return Variables.pickerBackgroundColor
        }
        set (setPickerBackgroundColor){
            Variables.pickerBackgroundColor = setPickerBackgroundColor
        }
    }
    
    public class var setPickerFontStyle: UIFont {
        get {
        return Variables.pickerFontStyle
        }
        set (setPickerFontStyle){
            Variables.pickerFontStyle = setPickerFontStyle
        }
    }
    
    public class var setPickerTextColor: UIColor {
        get {
        return Variables.pickerTextColor
        }
        set (setPickerTextColor){
            Variables.pickerTextColor = setPickerTextColor
        }
    }
    
    public class var setPickerTextAlignment: NSTextAlignment {
        get {
        return Variables.pickerTextAlignment
        }
        set (setPickerTextAlignment){
            Variables.pickerTextAlignment = setPickerTextAlignment
        }
    }
    
    
    // MARK: - CUSTOM PROPERTIES FOR TABLE VIEW CELL
    
    public func setLabelProperty(textColor: UIColor, textFontStyle: UIFont, textBackgroundColor: UIColor, textAlignment: NSTextAlignment) {
        label.textColor = textColor
        label.font = textFontStyle
        label.backgroundColor = textBackgroundColor
        label.textAlignment = textAlignment
    }
    
    public func setTextLabelProperty(textColor: UIColor, textFontStyle: UIFont, textBackgroundColor: UIColor, textAlignment: NSTextAlignment) {
        textLbl.textColor = textColor
        textLbl.font = textFontStyle
        textLbl.backgroundColor = textBackgroundColor
        textLbl.textAlignment = textAlignment
        
        textLbl.layer.masksToBounds = true
        textLbl.layer.cornerRadius = 3.0
        textLbl.layer.borderColor = UIColor.lightGrayColor().CGColor
        textLbl.layer.borderWidth = 0.5
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        var count = 0
        for item in pickerItems {
            count = count + 1
            if item as? String == currentItem {
                pickerView.selectRow(count-1, inComponent: 0, animated: false)
            }
        }
    }
    
    
    // MARK: - PICKER VIEW
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerItems[row] as! String
    }
    
    public func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var titleLbl = view as? UILabel
        if titleLbl == nil {
            titleLbl = UILabel()
            titleLbl!.textColor = Variables.pickerTextColor
            titleLbl!.textAlignment = Variables.pickerTextAlignment
            titleLbl!.numberOfLines = 1
            titleLbl!.font = Variables.pickerFontStyle
            titleLbl!.backgroundColor = Variables.pickerBackgroundColor
        }
        titleLbl!.text = pickerItems[row] as? String
        
        return titleLbl!
    }
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.delegate != nil {
            self.delegate?.updatePicker(pickerView.tag, row: row)
        }
    }

}
