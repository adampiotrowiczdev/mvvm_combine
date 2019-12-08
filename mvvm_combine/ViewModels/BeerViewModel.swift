//
//  ViewModel.swift
//  mvvm_combine
//
//  Created by Syner Media on 01/12/2019.
//

import Combine

class BeerViewModel : BaseViewModel {
    
    private struct Consts {
        static let beerArray = ["Komes","Tyskie","Łomża","Żywiec","Birra Moretti"]
    }
    
    let subject = PassthroughSubject<[String], Never>()
    
    required init() {
        
    }
    
    var beerNames = [String]()
    
    func fetchBeerNames() -> [String] {
        beerNames = Consts.beerArray
    }
}
