//
//  BaseViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import Combine
import PromiseKit

class BaseViewModel {
    var viewModelType : BaseViewModel.Type
    required init() {
        viewModelType = type(of: self)
    }
    
    func viewDidLoad() { }
    
    func asyncInitialize() -> Promise<()> { Promise<()>() }
    
    func viewWillAppear() { }
        
    func viewDidAppear() { }
       
    func viewWillDisappear() { }
       
    func viewDidDisappear() { }
}

class BaseViewModelWithParameter<T> : BaseViewModel {
    
    var parameterSubject = CurrentValueSubject<T?, Never>(nil)
    
    required init(_ parameter: T) {
        self.parameterSubject.send(parameter)
        super.init()
        viewModelType = type(of: self)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
