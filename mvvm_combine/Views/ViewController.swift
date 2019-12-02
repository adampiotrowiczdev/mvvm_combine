//
//  ViewController.swift
//  mvvm_combine
//
//  Created by Syner Media on 02/12/2019.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.tomato()
        
        button.setTitle("BEER", for: .normal)
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.center.equalTo(view)            
        }
        
        button.addTarget(self, action:#selector(beerTapped), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func beerTapped(_ sender : UIButton) {
        self.showToast(controller: self, message: "CHEERS", seconds: 1)
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
