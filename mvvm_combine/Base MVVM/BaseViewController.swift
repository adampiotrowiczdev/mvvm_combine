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
    var isNavigationBarHidden: Bool = false {
        didSet {
            navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: false)
        }
    }
    
    var spinnerView : UIView?
    
    override func viewDidLoad() {
        viewDidLoadBefore()
        super.viewDidLoad()
        viewModel.viewDidLoad()
        viewDidLoadAfter()
        async {
            self.showLoading()
            try! await( self.viewModel.asyncInitialize() )
            self.hideLoading()
        }
    }
    
    func viewDidLoadBefore() {
    }
    
    func viewDidLoadAfter() {
    }
    
    override final func viewWillAppear(_ animated: Bool) {
        viewWillAppearBefore()
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: false)
        viewModel.viewWillAppear()
        viewWillAppearAfter()
    }
    
    func viewWillAppearBefore() {
    }
    
    func viewWillAppearAfter() {
    }
    
    override final func viewDidAppear(_ animated: Bool) {
        viewDidAppearBefore()
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
        viewDidAppearAfter()
    }
    
    func viewDidAppearBefore() {
    }
    
    func viewDidAppearAfter() {
    }
    
    override final func viewWillDisappear(_ animated: Bool) {
        viewWillDisappearBefore()
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
        viewWillDisappearAfter()
    }
    
    func viewWillDisappearBefore() {
    }
    
    func viewWillDisappearAfter() {
    }
    
    override final func viewDidDisappear(_ animated: Bool) {
        viewDidDisappearBefore()
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
        viewDidDisappearAfter()
    }
    
    func viewDidDisappearBefore() {
    }
    
    func viewDidDisappearAfter() {
    }
    
    //TODO: Make Loading Presenter injected to ViewModel
    func showLoading() {
        DispatchQueue.main.async {
//          self.spinnerView = UIView.init(frame: self.view.bounds)
//          self.spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let ai = UIActivityIndicatorView.init(style: .large)
            ai.startAnimating()
            ai.center = self.view.center
            self.spinnerView = ai
            //self.spinnerView?.addSubview(ai)
            self.view.addSubview(ai)//self.spinnerView!)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.spinnerView?.removeFromSuperview()
        }
    }
}

