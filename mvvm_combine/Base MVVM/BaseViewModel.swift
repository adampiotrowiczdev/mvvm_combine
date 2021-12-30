//
//  BaseViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import Combine

class BaseViewModel {
    
//    static var beers = [BeerModel(name: "Komes", description: "IPA", alcoholPercentage: 7.0),
//                        BeerModel(name: "Tyskie", description: "Lager", alcoholPercentage: 5.6),
//                        BeerModel(name: "Łomża", description: "Lager", alcoholPercentage: 5.7),
//                        BeerModel(name: "Żywiec Białe", description: "Wheat", alcoholPercentage: 4.9),
//                        BeerModel(name: "Birra Moretti", description: "Lager", alcoholPercentage: 4.6),
//                        BeerModel(name: "Komes", description: "IPA", alcoholPercentage: 7.0),
//                        BeerModel(name: "Tyskie", description: "Lager", alcoholPercentage: 5.6),
//                        BeerModel(name: "Łomża", description: "Lager", alcoholPercentage: 5.7),
//                        BeerModel(name: "Żywiec Białe", description: "Wheat", alcoholPercentage: 4.9),
//                        BeerModel(name: "Birra Moretti", description: "Lager", alcoholPercentage: 4.6),
//                        BeerModel(name: "Komes", description: "IPA", alcoholPercentage: 7.0),
//                        BeerModel(name: "Tyskie", description: "Lager", alcoholPercentage: 5.6),
//                        BeerModel(name: "Łomża", description: "Lager", alcoholPercentage: 5.7),
//                        BeerModel(name: "Żywiec Białe", description: "Wheat", alcoholPercentage: 4.9),
//                        BeerModel(name: "Birra Moretti", description: "Lager", alcoholPercentage: 4.6),
//                        BeerModel(name: "Komes", description: "IPA", alcoholPercentage: 7.0),
//                        BeerModel(name: "Tyskie", description: "Lager", alcoholPercentage: 5.6),
//                        BeerModel(name: "Łomża", description: "Lager", alcoholPercentage: 5.7),
//                        BeerModel(name: "Żywiec Białe", description: "Wheat", alcoholPercentage: 4.9),
//                        BeerModel(name: "Birra Moretti", description: "Lager", alcoholPercentage: 4.6)]
   
    var viewModelType : BaseViewModel.Type
    required init() {
        viewModelType = type(of: self)
    }
    
    func viewDidLoad() { }
    
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
