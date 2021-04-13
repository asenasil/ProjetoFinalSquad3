//
//  CustumTableViewCell.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 13/04/21.
//

import UIKit

class CustumTableViewCell: UITableViewCell {

    // MARK: - Seleção de Outlets
    @IBOutlet weak var imagemCriptomoeda: UIImageView!
    
    @IBOutlet weak var imagemDeFavoritos: UIImageView!
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var siglaLabel: UILabel!
    
    @IBOutlet weak var cotacaoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
