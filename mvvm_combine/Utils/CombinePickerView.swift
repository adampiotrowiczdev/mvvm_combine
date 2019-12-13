//
//  CombinePickerView.swift
//  mvvm_combine
//
//  Created by Syner Media on 08/12/2019.
//

import UIKit
import Combine

protocol CombinePickerViewDataType {
    var rowName: String { get }
}

private struct Consts {
    static let numberOfColumnsInPicker = 1
}

class CombinePickerView<T:CombinePickerViewDataType>: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var pickerData : [T] = [T]() {
        didSet {
            self.reloadAllComponents()
        }
    }
    
    let selectedValue = PassthroughSubject<String, Never>()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Consts.numberOfColumnsInPicker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int , forComponent component: Int) -> String? {
        return pickerData[row].rowName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int , inComponent component: Int) {
        selectedValue.send(pickerData[row].rowName)
    }
}
    

