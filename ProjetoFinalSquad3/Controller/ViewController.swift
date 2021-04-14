//
//  ViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 13/04/21.
//

import UIKit

class ViewController: UIViewController {

    var criptomoedas = ListaCriptomoedasViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        criptomoedas.makeRequest()
        // Do any additional setup after loading the view.
        
        
    }

    
    
}

