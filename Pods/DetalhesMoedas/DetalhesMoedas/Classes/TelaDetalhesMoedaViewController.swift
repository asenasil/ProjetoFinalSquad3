//
//  TelaDetalhesMoedaViewController.swift
//  DetalhesMoedas
//
//  Created by Cristiane Goncalves Uliana on 14/04/21.
//

import UIKit
//import AlamofireImage

// APAGAR DEPOIS - VIRÁ NO MÓDULO COMMONS
//struct MoedaElement: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
//    let idIcon: String
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}
//
//typealias Moeda = [MoedaElement]

// APAGAR ATÉ AQUI

//public struct Botao {
//    public static let Adicionar = "ADICIONAR"
//    public static let Remover = "REMOVER"
//}

public class TelaDetalhesMoedaViewController: UIViewController {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var siglaLabel: UILabel?
    @IBOutlet weak var favoritoImage: UIImageView?
    @IBOutlet weak var moedaImage: UIImageView?
    @IBOutlet weak var valorMoedaLabel: UILabel?
    //@IBOutlet weak var botaoOutlet: UILabel?
    @IBOutlet weak var valorHoraLabel: UILabel?
    @IBOutlet weak var valorMesLabel: UILabel?
    @IBOutlet weak var valorAnoLabel: UILabel?
    @IBOutlet weak var botaoAdcRmv: UIButton?
    
    // MARK: - Atributos
    
//    var sigla: Substring = "BTC"
//    var favoritos = "USD|BTC|EUR"
//    var ehFavorito = false
//
    
    // MARK: - LifeCycle
    
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//        verificarFavoritos(sigla)
//       // makeRequestDetalhes(String(sigla))
//    }

    
    // MARK: - Métodos
    
    
//    func verificarFavoritos(_ sigla: Substring) {
//        let listaDeFavoritos = favoritos.split(separator: "|")
//
//        if listaDeFavoritos.contains(sigla) {
//            ehFavorito = true
//
//            //botaoOutlet.text = Botao.Remover
//            //botaoAdcRmv.setTitle(Botao.Remover, for: .application)
//        } else {
//            //botaoOutlet.text = Botao.Adicionar
//        }
//    }
    
//    func makeRequestDetalhes(_ sigla: String) {
//            //let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
//            let api = "https://rest-sandbox.coinapi.io/v1/assets/@@@?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C"
//            let newUrl = api.replacingOccurrences(of: "@@@", with: sigla)
//
//
//            let url = URL(string: newUrl)!
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                print(response as Any)
//                guard let responseData = data else { return }
//                do {
//                    let moeda = try JSONDecoder().decode(Moeda.self, from: responseData)
//                    print("***********************")
//                    print(moeda)
//                    self.configuraTela(moeda)
//                } catch let error {
//                    print("error: \(error)")
//                }
//            }
//            task.resume()
//        }
    
    
//    func configuraTela(_ moeda: Moeda) {
//        guard let siglaLabel = siglaLabel else {return}
//        siglaLabel.text = "USD"
//        
//        
//        
        
//        valorMoedaLabel.text = "$ "
//        valorHoraLabel.text = "$ "
//        valorMesLabel.text = "$ "
//        valorAnoLabel.text = "$ "
//        let caminhoIcon =
//        let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
//        //let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
//        let apiUrl = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/@@@.png"
//        let url = apiUrl.replacingOccurrences(of: "@@@", with: id)
        //moedaImage.af_setImage(withURL: url)
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}


extension UIViewController {

    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let b = Bundle(identifier: "org.cocoapods.demo.DetalhesMoedas") {
            bundle = b
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }

    public class func fromNib() -> Self {
        return fromNib(viewType: self)
    }

    public class func fromNib<T: UIViewController>(viewType: T.Type) -> T {
        if let nib = bundleUI.loadNibNamed(
            String(describing: viewType), owner: nil, options: nil)?.first as? T {
            return nib
        }
        return T()
    }

}
