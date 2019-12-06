//
//  ViewController.swift
//  mvvm_combine
//
//  Created by Syner Media on 02/12/2019.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var beerArray = ["Komes","Tyskie","Łomża","Żywiec","Birra Moretti"]

    private let button = UIButton()
    private let picker = UIPickerView()
    private let beerTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.tomato()
                        
        addSubviews()
        setUpConstraints()
        configureViews()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(button)
        view.addSubview(beerTextField)
    }
    
    fileprivate func setUpConstraints() {
        beerTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.width.equalTo(view)
        }
        
        button.snp.makeConstraints {
            $0.center.equalTo(view)
        }
    }
    
    fileprivate func configureViews() {
        
        picker.dataSource = self
        picker.delegate = self
        
        beerTextField.inputView = picker
        beerTextField.attributedPlaceholder = NSAttributedString(string: "placeholder text",
                                                                 attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        beerTextField.tintColor = .clear
        beerTextField.placeholder = "Choose your taste here"
        beerTextField.backgroundColor = R.color.tomato()
        beerTextField.borderStyle = .roundedRect
        beerTextField.font = UIFont.systemFont(ofSize: 20)
        beerTextField.textAlignment = .center
        beerTextField.textColor = .white
        
        button.addTarget(self, action:#selector(beerTapped), for: .touchUpInside)
        button.setTitle("DRINK", for: .normal)
        
    }
    
    @objc func beerTapped(_ sender : UIButton) {
        self.showToast(controller: self, message: "CHEERS", seconds: 1)
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return beerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int , forComponent component: Int) -> String? {
        return beerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int , inComponent component: Int) {
        beerTextField.text = beerArray[row]
        self.view.endEditing(true)
    }
}
