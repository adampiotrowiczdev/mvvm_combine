//
//  ViewController.swift
//  mvvm_combine
//
//  Created by Syner Media on 02/12/2019.
//

import UIKit
import SnapKit

class BeerViewController: BaseViewController<BeerViewModel> {
    
    private struct Consts {
        static let numberOfColumnsInPicker = 1
        static let beerTextFieldFontSize : CGFloat = 20
        static let beetTextFieldTopOffset : CGFloat = 50
        static let toastShowingTime : Double = 50
    }
    
    private let drinkButton = FactoryView.drinkButton
    private let beerPicker = FactoryView.beerPicker
    private let beerTextField = FactoryView.beerTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    private func addSubviews() {
        view.addSubview(drinkButton)
        view.addSubview(beerTextField)
    }
    
    private func setUpConstraints() {
        beerTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Consts.beetTextFieldTopOffset)
            $0.width.equalTo(view)
        }
        
        drinkButton.snp.makeConstraints {
            $0.center.equalTo(view)
        }
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.tomato()
        beerPicker.dataSource = self
        beerPicker.delegate = self
        beerTextField.inputView = beerPicker
        drinkButton.addTarget(self, action:#selector(beerTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        beerPicker.dataSource = 
        viewModel.subject.subscribe(beerPicker.dataSource )
    }
    
    @objc func beerTapped(_ sender : UIButton) {
        Toast().show(controller: self, message: "CHEERS", seconds: Consts.toastShowingTime)
    }
    
    private struct FactoryView {
        static var drinkButton : UIButton {
            let button = UIButton()
            button.setTitle("DRINK", for: .normal)
            return button
        }
        
        static var beerPicker : UIPickerView {
            let picker = UIPickerView()
            return picker
        }
        
        static var beerTextField: UITextField {
            let textField = UITextField()
            textField.tintColor = .clear
            textField.backgroundColor = R.color.tomato()
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: Consts.beerTextFieldFontSize)
            textField.textAlignment = .center
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(string: "Choose your taste here",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
            return textField
        }
    }
    
}

extension BeerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Consts.numberOfColumnsInPicker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Consts.beerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int , forComponent component: Int) -> String? {
        return Consts.beerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int , inComponent component: Int) {
        beerTextField.text = Consts.beerArray[row]
        self.view.endEditing(true)
    }
}




