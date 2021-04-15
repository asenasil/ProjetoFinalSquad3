//
//  MoedasViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import Commons
import CoreData

struct CriptoMoeda: Codable {
    
let idIcon, assetID, name: String
let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: Int
let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: Int
let dataSymbolsCount, volume1HrsUsd, volume1DayUsd, volume1MthUsd: Int
let priceUsd: Int

enum CodingKeys: String, CodingKey {
case idIcon = "id_icon"
case assetID = "asset_id"
case name
case dataStart = "data_start"
case dataEnd = "data_end"
case dataQuoteStart = "data_quote_start"
case dataQuoteEnd = "data_quote_end"
case dataOrderbookStart = "data_orderbook_start"
case dataOrderbookEnd = "data_orderbook_end"
case dataTradeStart = "data_trade_start"
case dataTradeEnd = "data_trade_end"
case dataSymbolsCount = "data_symbols_count"
case volume1HrsUsd = "volume_1hrs_usd"
case volume1DayUsd = "volume_1day_usd"
case volume1MthUsd = "volume_1mth_usd"
case priceUsd = "price_usd"
    }
}

typealias CriptoMoedas = [CriptoMoeda]



class MoedasViewController: UIViewController {

     // MARK: - Outlets
    @IBOutlet weak var listaMoedas: UIStackView!
    
    @IBOutlet weak var tituloMoeda: UILabel!
    
    @IBOutlet weak var dataMoeda: UILabel!
    
    @IBOutlet weak var pesquisaMoeda: UISearchBar!
    
   
    // MARK: - Selecao de Atributos da Classe

    var listaDeMoedas:[Moeda] = []

    var favoritos: Favoritos?

    var contexto: NSManagedObjectContext {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext

        }
    
    
    // MARK: - NovoCiclo
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        
    }

    public func makeRequest() {

            let url = URL( string: "https://6076e5cf1ed0ae0017d6a02f.mockapi.io/api/v1/users")!

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                print(response as Any)

                guard let responseData = data else { return }

                do {

                    let moedas = try JSONDecoder().decode(CriptoMoedas.self, from: responseData)

                    for moeda in moedas {

                        let nomeMoeda = moeda.name
                        let siglaID = moeda.assetID
                        let imagemMoeda = moeda.idIcon
                        let cotacaoMoeda = moeda.priceUsd
                        
                        let novaMoeda = Moeda(nomeMoeda, siglaID, imagemMoeda, cotacaoMoeda)
                        
                        self.listaDeMoedas.append(novaMoeda)

                    }

                    print(moedas)

                } catch let error {

                    print("error: \(error)")

                }

            }

            task.resume()
        }
    
}

