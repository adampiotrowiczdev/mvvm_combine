//
//  Toast.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import UIKit

class Toast {
    
    private struct Consts {
        static let alpha : CGFloat = 0.6
        static let cornerRadius : CGFloat = 15
    }
    
    func show(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = Consts.alpha
        alert.view.layer.cornerRadius = Consts.cornerRadius

        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
