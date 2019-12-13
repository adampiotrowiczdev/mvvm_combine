//
//  ViewModel.swift
//  mvvm_combine
//
//  Created by Syner Media on 01/12/2019.
//

import Combine

class BeerViewModel : BaseViewModel {
    
    private struct Consts {
        static let beers = [BeerModel(name: "Komes", description: "IPA"),
                            BeerModel(name: "Tyskie", description: "Lager"),
                            BeerModel(name: "Łomża", description: "Lager"),
                            BeerModel(name: "Żywiec Białe", description: "Pszeniczne"),
                            BeerModel(name: "Birra Moretti", description: "Italiano birra")]
    }
    
    let beerNames = PassthroughSubject<[BeerModel], Never>()
    
    required init() {
    }
        
    func fetchBeerNames() {
        beerNames.send(Consts.beers)
    }
}
