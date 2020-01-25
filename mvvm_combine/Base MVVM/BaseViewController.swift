//
//  BaseViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import UIKit
import Combine
import AwaitKit

class BaseViewController<T:BaseViewModel>: UIViewController {

    init(_ viewModel: T = T()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    var viewModel: T
    var cancelBag = Set<AnyCancellable>()
    var isNavigationBarHidden: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        async {
            self.viewModel.asyncInitialize()
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
}
