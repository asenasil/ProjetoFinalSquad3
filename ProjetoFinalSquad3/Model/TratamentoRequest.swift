//
//  TratamentoRequest.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 16/04/21.
//

import Foundation

import UIKit
import Alamofire
import Commons

protocol TratamentoRequestMoeda{
    func getDataServidor(complete: @escaping (_ success: Bool, _ moeda: [Moeda]?) -> Void)
}
class TratamentoRequest: TratamentoRequestMoeda{
    func getDataServidor(complete: @escaping (Bool, [Moeda]?) -> Void) {
        AF.request(ApiRest.TodasAsMoedas).validate().responseDecodable(of: [Moeda].self){ apiResponde in
            switch apiResponde.result {
            case .success(let evento):
                complete(true, evento)
            case .failure(let error):
                print(error)
                if let httpResposta = apiResponde.response?.statusCode{
                    switch httpResposta {
                    case 400:
                        self.alertaDoWindow(message: "Erro 400: Bad Request", "Falha na requisição dos dados, sintaxe invalida!")
                    case 401:
                        self.alertaDoWindows(message: "Erro 401: Unauthorized", "Falha na requisição dos dados, autenticação inválida!")
                    case 403:
                        self.alertaDoWindows(message: "Erro 403: Forbidden", "Falha na requisição dos dados, sem permissão para acesso!")
                    case 429:
                        self.alertaDoWindows(message: "Erro 429: Too Many Requests", "Falha na requisição dos dados, quantidade de requisição excedida!")
                    case 550:
                        self.alertaDoWindows(message: "Erro 550: No Data", "Falha na requisição dos dados, o dado nao existe!")
                        break
                    default:
                        break
                    }
                    }
                }
        }
    }
}
    extension TratamentoRequest {
        
    func alertaDoWindow(message: String){
            let alerta = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
            let botaoOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(botaoOk)
            self.present(alerta, animated: true, completion: nil)
        }
    }
    


    
