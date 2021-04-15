//
//  ViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 13/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stack: UIStackView!
    
    var criptomoedas = ListaCriptomoedasViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        criptomoedas.makeRequest()
        // Do any additional setup after loading the view.
        
        
    }

    func setupUI(){
        let listaCriptomoedas = ListaCriptomoedasViewController()
        
    }
    
}

