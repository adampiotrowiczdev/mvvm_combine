//
//  BaseView.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 18/04/2020.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

}
