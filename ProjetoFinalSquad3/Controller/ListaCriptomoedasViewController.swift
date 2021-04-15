import UIKit
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

class ListaCriptomoedasViewController: UIViewController {
    
    // MARK: - Selecao de Outlets
    

    
    
    
    // MARK: - Selecao de Atributos da Classe
    
    var listaDeMoedas:[Moeda] = []
    
    var favoritos: Favoritos?
    
    var contexto:NSManagedObjectContext {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext

        }
    
    // MARK: - Construtor da Classe
    
    
    
    // MARK: - Iniciador de Ciclo
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
