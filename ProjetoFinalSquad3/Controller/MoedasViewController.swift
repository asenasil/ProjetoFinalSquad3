//
//  MoedasViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import Commons
import AlamofireImage
import DetalhesMoedas

class MoedasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     // MARK: - Outlets
    
    
    
    @IBOutlet weak var listaMoedas: UITableView!
    
    // MARK: - Selecao de Atributos da Classe

    var listaDeMoedas:[Moeda] = []

    var favoritos: Favoritos?
    
//    var moedas: CriptoMoedas = []

    // MARK: - NovoCiclo
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaMoedas.register(UINib(nibName: "CustumTableViewCell", bundle: nil), forCellReuseIdentifier: "CustumTableViewCell")
        
        self.listaMoedas.delegate = self
        self.listaMoedas.dataSource = self
        makeRequestDetalhes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDeMoedas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustumTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CustumTableViewCell", for: indexPath) as? CustumTableViewCell

//        cell?.bitcoinLabel.text
//        cell?.imagemCriptomoeda.image = UIImage(named: "")
//        cell?.imagemDeFavoritos.image = UIImage(named: "")
//        cell?.siglaLabel.text
//        cell?.cotacaoLabel.text
        
        return cell ?? UITableViewCell()
    }

     func makeRequestDetalhes() {
//            let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
        let url = URL(string: ApiRest.TodasAsMoedas)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moedas.self, from: responseData)
                    
                    for moeda in moedas {
                            print(moeda)
                    }
                } catch let error {
                    print("error: \(error)")
                }
            }
            task.resume()
        }
    
    func configuraTela(_ moeda: Moeda){

//        let preco = moeda.priceUsd ?? 0

    }

}

