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
        static let beers = [BeerModel(name: "Komes", description: "IPA"),
                            BeerModel(name: "Tyskie", description: "Lager"),
                            BeerModel(name: "Łomża", description: "Lager"),
                            BeerModel(name: "Żywiec Białe", description: "Wheat"),
                            BeerModel(name: "Birra Moretti", description: "Lager")]
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
