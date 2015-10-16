# TableCellPicker

[![Version](https://img.shields.io/cocoapods/v/TableCellPicker.svg?style=flat)](http://cocoapods.org/pods/TableCellPicker)
[![License](https://img.shields.io/cocoapods/l/TableCellPicker.svg?style=flat)](http://cocoapods.org/pods/TableCellPicker)
[![Platform](https://img.shields.io/cocoapods/p/TableCellPicker.svg?style=flat)](http://cocoapods.org/pods/TableCellPicker)

###For Swift
```swift
import TableCellPicker

// Add the following in viewDidLoad:
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

// Fill-in the code for the TableView functions
// See sample code on the Example Project
```

###Example Project
Run the Example Project to see the whole sample code on how to use the TableCellPicker pod in a project.


## Installation

TableCellPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TableCellPicker"
```

## License

TableCellPicker is available under the MIT license. See the LICENSE file for more info.
