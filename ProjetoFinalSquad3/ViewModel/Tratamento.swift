//
//  Tratamento.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 16/04/21.
//

import UIKit

class Tratamento: NSObject {

    func alertaDoWindow(title: String, message: String){
        DispatchQueue.main.async(execute: {
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.windowLevel = UIWindow.Level.alert + 1
            
            let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alerta.addAction(cancelar)
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alerta, animated: true, completion: nil)
                
            })
        }
}

