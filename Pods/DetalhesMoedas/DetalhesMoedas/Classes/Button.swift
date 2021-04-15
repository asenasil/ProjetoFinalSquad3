//
//  Button.swift
//  DetalhesMoedas
//
//  Created by Cristiane Goncalves Uliana on 15/04/21.
//

import Foundation

public struct ButtonDetalhes {
    public static var centralButton: UIButton = {
    let button = UIButton(frame: CGRect())
    button.backgroundColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    button.layer.cornerRadius = 10
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
    return button
    }()
}

public struct ActionButton {
    public static let Adicionar = "ADICIONAR"
    public static let Remover = "REMOVER"
}
