//
//  ViewController.swift
//  mvvm_combine
//
//  Created by Syner Media on 02/12/2019.
//

import UIKit
import SnapKit
import Combine

class BeerViewController: BaseViewController<BeerViewModel> {
    
    private struct Consts {
        static let beerTextFieldFontSize : CGFloat = 20
        static let beetTextFieldTopOffset : CGFloat = 50
        static let toastShowingTime : Double = 1
    }
    

    var beerModel : BeerModel = BeerModel(name: "piwo", description: "wiedz ze bylo dobre")
    
    private let drinkButton = FactoryView.drinkButton
    private let beerPicker = FactoryView.beerPicker
    private let beerTextField = FactoryView.beerTextField
    
    private var pickerDataSubscriber : AnyCancellable?
    private var pickerSelectedValueSubscriber : AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         viewModel.fetchBeerNames()
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
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
        isNavigationBarHidden = true
        view.backgroundColor = R.color.tomato()
        beerTextField.inputView = beerPicker
        drinkButton.addTarget(self, action:#selector(drinkTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        pickerDataSubscriber = viewModel.beerNames.sink( receiveValue: { value in
            self.beerPicker.pickerData = value
        })
        pickerSelectedValueSubscriber = beerPicker.selectedValue.sink(receiveValue: { value in
            self.beerTextField.text = value.name
            self.beerModel = value
            self.view.endEditing(true)
        })
    }
    
    @objc func drinkTapped(_ sender : UIButton) {
        let descriptionViewModel = DescriptionViewModel(parameter: beerModel)
        guard let descViewModel = descriptionViewModel else { return }
        let descriptionViewController = DescriptionViewController(viewModel: descViewModel)
        self.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
    private struct FactoryView {
        static var drinkButton : UIButton {
            let button = UIButton()
            button.setTitle("DRINK", for: .normal)
            return button
        }
        
        static var beerPicker : CombinePickerView<BeerModel> {
            let picker = CombinePickerView<BeerModel>()
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
