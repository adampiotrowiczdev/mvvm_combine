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
    
    let beerNames = PassthroughSubject<[String], Never>()
    
    required init() {
    }
        
    func fetchBeerNames() {
        beerNames.send(["Komes","Tyskie","Łomża","Żywiec","Birra Moretti"])
    }
}
