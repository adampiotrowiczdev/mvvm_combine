//
//  ViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit

class BeerViewModel : BaseViewModel {
    
    private struct Consts {
        static let beers = [BeerModel(name: "Komes", description: "IPA", percentage: 7.0),
                            BeerModel(name: "Tyskie", description: "Lager", percentage: 5.6),
                            BeerModel(name: "Łomża", description: "Lager", percentage: 5.7),
                            BeerModel(name: "Żywiec Białe", description: "Wheat", percentage: 4.9),
                            BeerModel(name: "Birra Moretti", description: "Lager", percentage: 4.6)]
    }
    
    let beerNames = PassthroughSubject<[BeerModel], Never>()
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    
    required init() {
        super.init()
    }
        
    func fetchBeerNames() {
        beerNames.send(Consts.beers)
    }
    
    func navigateToDescriptionView(viewController: UIViewController) {
        guard let parameter = selectedBeer.value else { return }
        let descriptionViewModel = DescriptionViewModel(parameter)
        let descriptionViewController = DescriptionViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)

    }
}
