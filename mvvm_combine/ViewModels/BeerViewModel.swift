//
//  ViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit
import AwaitKit
import PromiseKit

class BeerViewModel : BaseViewModel {
    
    private struct Consts {
        static let beers = [BeerModel(name: "Komes", description: "IPA"),
                            BeerModel(name: "Tyskie", description: "Lager"),
                            BeerModel(name: "Łomża", description: "Lager"),
                            BeerModel(name: "Żywiec Białe", description: "Pszeniczne"),
                            BeerModel(name: "Birra Moretti", description: "Italiano birra")]
    }
    
    let beerNames = PassthroughSubject<[BeerModel], Never>()
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    
    required init() {
        super.init()
    }
    
    override func asyncInitialize() {
        async {
            self.beerNames.send(try await(self.fetchBeerNames()))
            self.beerNames.send(try await(self.fetchBeerEmpty()))
        }
    }
    
    private func fetchBeerNames() -> Promise<[BeerModel]> {
        async {
            sleep(10)
            return Consts.beers
        }
    }
    
    private func fetchBeerEmpty() -> Promise<[BeerModel]> {
        async {
            sleep(10)
            return [BeerModel]()
        }
    }
    
    func navigateToDescriptionView(viewController: UIViewController) {
        guard let parameter = selectedBeer.value else { return }
        let descriptionViewModel = DescriptionViewModel(parameter)
        let descriptionViewController = DescriptionViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
}
