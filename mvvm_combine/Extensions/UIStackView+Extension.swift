//
//  UIStackView+Extension.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 18/04/2020.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
}
