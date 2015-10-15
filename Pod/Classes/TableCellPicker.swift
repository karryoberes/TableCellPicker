//
//  TableCellPicker.swift
//  Pods
//
//  Created by Oberes, Karry Raia C. on 10/15/15.
//
//

import UIKit

public protocol TableCellPickerDelegate{
    /// Call the updatePicker delegate to know which pickerview is used (if there is more than 1 pickerview  used) and display the selected value from the said pickerview.
    func updatePicker(pickerTag: Int, row: Int)
}

public class TableCellPicker: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - VARIABLES
    
    /// Outlet for the pickerview in the tableview cell.
    @IBOutlet public var pickerView: UIPickerView!
    /// Outlet for the title label in the tableview cell.
    @IBOutlet public var label: UILabel!
    /// Outlet for the selected value label in the tableview cell.
    @IBOutlet public var textLbl: UILabel!
    
    /// Delegate for the tableview cell
    public var delegate: TableCellPickerDelegate?
    /// Values displayed in the pickerview
    public var pickerItems: NSArray = []
    /// Current value selected in the pickerview
    public var currentItem: String?
    
    /// A container of the values to be used for the tableview cell and pickerview.
    public struct Variables {
        /**
        The default value of the selected index path when the cell is displayed.
        
        :param: 0 The first row tableview cell is expanded.
        :param: -1 The first row tableview cell is displayed normally.
        */
        public static var selectedIndexPath:NSIndexPath? = NSIndexPath(forRow: -1, inSection: 0)
        /// The default normal height of the tableview cell when displayed.
        public static var normalHeight: CGFloat = 0
        /// The default expanded height of the tableview cell when displayed.
        public static var expandedHeight: CGFloat = 0
        
        /// The default background color of the pickerview.
        public static var pickerBackgroundColor : UIColor = UIColor.whiteColor()
        /// The default font style of the pickerview.
        public static var pickerFontStyle : UIFont = UIFont(name: "Arial", size: 20)!
        /// The default text color of the pickerview.
        public static var pickerTextColor : UIColor = UIColor.blackColor()
        /// The default text alignment of the pickerview.
        public static var pickerTextAlignment : NSTextAlignment = NSTextAlignment.Center
    }
    
    /// Stores the selected indexpath of the tableview cell to be displayed.
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
    
    /// Stores the normal height of the tableview cell to be displayed.
    public class var normalHeight: CGFloat {
        get {
        return Variables.normalHeight
        }
        set {
            Variables.normalHeight = newValue
        }
    }
    
    /// Stores the expanded height of the tableview cell to be displayed.
    public class var expandedHeight: CGFloat {
        get {
        return Variables.expandedHeight
        }
        set {
            Variables.expandedHeight = newValue
        }
    }
    
    /// Returns the specified tableview cell height for each indexpath; e.g. if selected, returns the expanded height.
    public class func fetchCellHeight(indexPath: NSIndexPath) -> CGFloat {
        if selectedIndexPath == indexPath {
            return Variables.expandedHeight
        }
        return Variables.normalHeight
    }
    
    
    // MARK: - CUSTOM PROPERTIES FOR PICKER VIEW
    
    /// Stores the background color of the pickerview to be displayed.
    public class var setPickerBackgroundColor: UIColor {
        get {
        return Variables.pickerBackgroundColor
        }
        set (setPickerBackgroundColor){
            Variables.pickerBackgroundColor = setPickerBackgroundColor
        }
    }
    
    /// Stores the font style of the pickerview to be displayed.
    public class var setPickerFontStyle: UIFont {
        get {
        return Variables.pickerFontStyle
        }
        set (setPickerFontStyle){
            Variables.pickerFontStyle = setPickerFontStyle
        }
    }
    
    /// Stores the text color of the pickerview to be displayed.
    public class var setPickerTextColor: UIColor {
        get {
        return Variables.pickerTextColor
        }
        set (setPickerTextColor){
            Variables.pickerTextColor = setPickerTextColor
        }
    }
    
    /// Stores the text alignment of the pickerview to be displayed.
    public class var setPickerTextAlignment: NSTextAlignment {
        get {
        return Variables.pickerTextAlignment
        }
        set (setPickerTextAlignment){
            Variables.pickerTextAlignment = setPickerTextAlignment
        }
    }
    
    
    // MARK: - CUSTOM PROPERTIES FOR TABLE VIEW CELL
    
    /** 
    Returns the custom properties for the title label in the tableview cell.
    
    :param: textColor The text color of the title label.
    :param: textfontStyle The font style of the title label.
    :param: textBackgroundColor The background Color of the title label.
    :param: textAlignment The text alignment of the title label.
    */
    public func setLabelProperty(textColor: UIColor, textFontStyle: UIFont, textBackgroundColor: UIColor, textAlignment: NSTextAlignment) {
        label.textColor = textColor
        label.font = textFontStyle
        label.backgroundColor = textBackgroundColor
        label.textAlignment = textAlignment
    }
    
    /** 
    Returns the custom properties for the selected value label in the tableview cell.
    
    :param: textColor The text color of the selected value label.
    :param: textfontStyle The font style of the selected value label.
    :param: textBackgroundColor The background Color of the selected value label.
    :param: textAlignment The text alignment of the selected value label.
    */
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
