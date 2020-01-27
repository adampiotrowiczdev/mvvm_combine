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
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift
import CodableFirebase

class BeerViewModel : BaseViewModel {
    
    //MARK: Example of adding records to firestore
    //    Consts.beers.forEach { beer in
    //        try! Firestore.firestore().collection("beers").addDocument(from: beer)
    //    }
    //    private struct Consts {
    //        static let beers = [BeerModel(name: "Komes", description: "IPA"),
    //                            BeerModel(name: "Tyskie", description: "Lager"),
    //                            BeerModel(name: "Łomża", description: "Lager"),
    //                            BeerModel(name: "Żywiec Białe", description: "Pszeniczne"),
    //                            BeerModel(name: "Birra Moretti", description: "Italiano birra")]
    //    }
    
    let beerNames = PassthroughSubject<[BeerModel], Never>()
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    
    required init() {
        super.init()
    }
    
    override func asyncInitialize() -> Promise<()> {
        async {
            self.beerNames.send(try! await(self.fetchBeerNames()))
        }
    }
    
    private func fetchBeerNames() -> Promise<[BeerModel]> {
        return Promise<[BeerModel]>  { seal in
            let beersFireCollection = Firestore.firestore().collection("beers")
            beersFireCollection.getDocuments { querySnapshot, _  in
                seal.fulfill(querySnapshot!.documents.map { document in
                    //TODO: remove after tests, simulate longer loading time
                    usleep(500000)
                    return try! FirestoreDecoder().decode(BeerModel.self, from: document.data())
                })
            }
        }
    }
    
    func navigateToDescriptionView(viewController: UIViewController) {
        guard let parameter = selectedBeer.value else { return }
        let descriptionViewModel = DescriptionViewModel(parameter)
        let descriptionViewController = DescriptionViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
}

//TODO: Probably to remove, to ugly way to do that, this property shoud be accessible in Coordinator
//extension UIApplication {
//    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let nav = base as? UINavigationController {
//            return topViewController(base: nav.visibleViewController)
//        }
//        if let tab = base as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(base: selected)
//            }
//        }
//        if let presented = base?.presentedViewController {
//            return topViewController(base: presented)
//        }
//        return base
//    }
//}
