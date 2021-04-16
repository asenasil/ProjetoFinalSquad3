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


public struct Cripto: Codable {
//    public let idIcon: String
    public let assetID: String
//    public let name: String
//    public let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: Int
//    public let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: Int
//    public let dataSymbolsCount, volume1HrsUsd, volume1DayUsd, volume1MthUsd: Int
    public let priceUsd: Int?

public enum CodingKeys: String, CodingKey {
//        case idIcon = "id_icon"
        case assetID = "asset_id"
//        case name
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
////        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
    }
}
public typealias Criptos = [Cripto]



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
                    let moedas = try JSONDecoder().decode(Criptos.self, from: responseData)
                    
                    for moeda in moedas{
                        DispatchQueue.main.async {
                            self.configuraTela(moeda)
                            print(moeda)
                        }
                    }
                } catch let error {
                    print("error: \(error)")
                }
            }
            task.resume()
        }
    
    func configuraTela(_ moeda: Cripto){

        let preco = moeda.priceUsd ?? 0

        
    }

}

