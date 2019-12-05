//
//  ViewController.swift
//  mvvm_combine
//
//  Created by Syner Media on 02/12/2019.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    var beerArray = ["Komes","Tyskie","Łomża","Żywiec","Birra Moretti"]

    private let button = UIButton()
    private let picker = UIPickerView()
    private let beerTextField = UITextField(frame: CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width - 20, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.tomato()
        
        button.setTitle("DRINK", for: .normal)
        
        view.addSubview(button)
        view.addSubview(beerTextField)
        
        button.snp.makeConstraints {
            $0.center.equalTo(view)            
        }
        
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
        
        // Do any additional setup after loading the view.
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
    ///picker
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
        self.view.endEditing(false)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
