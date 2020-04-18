//
//  BeersView.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 18/04/2020.
//

import UIKit

private struct Consts {
    static let beerTextFieldFontSize: CGFloat = 20
    static let beetTextFieldTopOffset: CGFloat = 50
    static let floatingButtonSize: CGFloat = 50
    static let floatingButtonFontSize: CGFloat = 30
    static let toastShowingTime: Double = 1
}

class BeersView: BaseView {
    
    let drinkButton = FactoryView.drinkButton
    let beerTextField = FactoryView.beerTextField
    let floatingAddButton = FactoryView.floatingAddButton
    let tableView = FactoryView.beerTableView

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
   private func addSubviews() {
       addSubview(tableView)
       addSubview(floatingAddButton)
   }
   
   private func setUpConstraints() {
       tableView.snp.makeConstraints {
           $0.edges.equalTo(safeAreaLayoutGuide)
       }
       floatingAddButton.snp.makeConstraints {
           $0.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(Consts.floatingButtonSize)
           $0.size.equalTo(Consts.floatingButtonSize)
       }
   }
}

private struct FactoryView {
    static var drinkButton : UIButton {
        let button = UIButton()
        button.setTitle("DRINK", for: .normal)
        button.isEnabled = false
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
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Choose your taste here",
                                                             attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }
    
    static var floatingAddButton: UIButton {
        let button = UIButton()
        button.contentHorizontalAlignment = .center;
        button.titleLabel?.font = button.titleLabel?.font.withSize(Consts.floatingButtonFontSize)
        button.setTitleColor(R.color.gray(), for: .normal)
        button.setTitle("+", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = Consts.floatingButtonSize/2
        return button
    }
    
    static var beerTableView: UITableView {
        let tableView = UITableView()
        tableView.register(BeerCell.self, forCellReuseIdentifier: "BeerCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .white
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        return tableView
    }
}
