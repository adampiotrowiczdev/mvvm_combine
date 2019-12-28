//
//  BaseViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import UIKit

class BaseViewController<T:BaseViewModel>: UIViewController {

    init(viewModel: T = T()!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    var viewModel: T
    
    var isNavigationBarHidden: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: animated)
    }
}
