//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import Foundation
import UIKit

class DescriptionViewController: BaseViewController<DescriptionViewModel> {
    
    var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = false
        self.view.backgroundColor = .systemOrange
           addSubviews()
           setUpConstraints()
            textField.text = viewModel.parameter.description
       }

       private func addSubviews() {
           view.addSubview(textField)
       }
       
       private func setUpConstraints() {
           textField.snp.makeConstraints {
               $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
               $0.width.equalTo(view)
           }
       }
}
