//
//  CriptoMoeda.swift
//  Commons
//
//  Created by Leonardo Oliveira Portes on 14/04/21.
//

import Foundation

struct CriptoMoeda: Codable {
    let idIcon: String
    let assetID: String
    let name: String
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
 
