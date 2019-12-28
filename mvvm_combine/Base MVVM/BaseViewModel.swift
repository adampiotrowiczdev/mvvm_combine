//
//  BaseViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

class BaseViewModel {
    
    required init?() { }
}

class BaseViewModelWithParameter<T> : BaseViewModel {
    
    var parameter: T
    
    required init?(parameter: T) {
        self.parameter = parameter
        super.init()
    }
    
    required init?() {
        return nil
    }
}
