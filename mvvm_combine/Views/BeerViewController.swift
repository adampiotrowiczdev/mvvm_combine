//
//  ViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 02/12/2019.
//

import UIKit
import SnapKit
import Combine

class BeerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
         
    }
    //<BeerViewModel> {
    
    @objc func injected() {
        view.subviews.forEach {
            $0.removeFromSuperview()
        }
        viewDidLoad()
    }
    
    private struct Consts {
        static let beerTextFieldFontSize : CGFloat = 20
        static let beetTextFieldTopOffset : CGFloat = 50
        static let toastShowingTime : Double = 1
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
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         //viewModel.fetchBeerNames()
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
     }

    private func addSubviews() {
        view.addSubview(drinkButton)
        view.addSubview(beerTextField)
    }
    
    private func setUpConstraints() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        view.addSubview(tableView)
        beerTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Consts.beetTextFieldTopOffset)
            $0.width.equalTo(view)
        }
        drinkButton.snp.makeConstraints {
            $0.center.equalTo(view)
        }
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(drinkButton.snp.bottom).offset(25)
        }
    }
    
    private func configureViews() {
        //isNavigationBarHidden = true
        view.backgroundColor = R.color.gray()
        beerTextField.inputView = beerPicker
        drinkButton.addTarget(self, action:#selector(drinkTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
//        cancelBag.collect {
//            viewModel.beerNames.sink( receiveValue: { value in
//                self.beerPicker.pickerData = value
//            })
//            beerPicker.selectedValue.subscribe(viewModel.selectedBeer)
//            viewModel.selectedBeer.sink(receiveValue: { value in
//                self.drinkButton.isEnabled = value != nil
//                guard let beer = value else { return }
//                self.beerTextField.text = beer.name
//                self.view.endEditing(true)
//            })
//        }
    }
    
    @objc func drinkTapped(_ sender : UIButton) {
        let descriptionViewController = DescriptionViewController()//(descriptionViewModel)
        navigationController?.pushViewController(descriptionViewController, animated: true)
        //viewModel.navigateToDescriptionView(viewController: self)
    }
    
    private struct FactoryView {
        static var drinkButton : UIButton {
            let button = UIButton()
            button.setTitle("DRINK", for: .normal)
            //button.isEnabled = false
            return button
        }
        
        static var beerPicker : CombinePickerView<BeerModel> {
            let picker = CombinePickerView<BeerModel>()
            return picker
        }
        
        static var beerTextField: UITextField {
            let textField = UITextField()
            textField.tintColor = .clear
            textField.backgroundColor = R.color.light_gray()
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: Consts.beerTextFieldFontSize)
            textField.textAlignment = .center
            textField.backgroundColor = .white
            textField.attributedPlaceholder = NSAttributedString(string: "Choose your taste here",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
            return textField
        }
    }
    
}
