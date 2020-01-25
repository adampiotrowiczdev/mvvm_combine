//
//  CombinePickerView.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 08/12/2019.
//

import UIKit
import Combine
import AwaitKit

protocol CombinePickerViewDataType {
    var rowName: String { get }
}

private struct Consts {
    static let numberOfComponents = 1
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
            DispatchQueue.main.async {
                self.reloadAllComponents()
            }
        }
    }
    
    let selectedValue = CurrentValueSubject<T?, Never>(nil)

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Consts.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int , forComponent component: Int) -> String? {
        return pickerData[row].rowName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int , inComponent component: Int) {
        selectedValue.send(!pickerData.isEmpty ? pickerData[row] : nil)
    }
}
    

