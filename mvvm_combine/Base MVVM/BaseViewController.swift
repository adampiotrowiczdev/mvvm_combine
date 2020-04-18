//
//  BaseViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import UIKit
import Combine

class BaseViewController<VMType:BaseViewModel, VType: BaseView>: UIViewController {

    init(_ viewModel: VMType = VMType()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    var viewModel: VMType
    var viewCasted: VType = VType()
    var cancelBag = Set<AnyCancellable>()
    var isNavigationBarHidden: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
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
