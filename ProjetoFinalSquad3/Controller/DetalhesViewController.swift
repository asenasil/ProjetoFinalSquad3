//
//  DetalhesViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import DetalhesMoedas

class DetalhesViewController: UIViewController {

    let detalhes = DetalhesMoeda.fromNib()
    
    var favoritos: Favoritos?
    
    @IBOutlet var telaDetalhes: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telaDetalhes.addSubview(detalhes)
        
        detalhes.verificarFavoritos(favoritos?.lista ?? "", Substring("BTC"))
        detalhes.makeRequestDetalhes(sigla: "BTC")
       
    }
}
