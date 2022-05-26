//
//  ItemsData.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 26.05.2022.
//

import Foundation

struct ItemsData: Decodable {
    let data: [Data]
    let view: [String]
    
    struct Data: Decodable {
        let name: String
        let data: ItemData
        
        struct ItemData: Decodable {
            let url: String?
            let text: String?
            let selectedId: Int?
            let variants: [Variant]?
            
            struct Variant: Decodable {
                let id: Int
                let text: String
            }
        }
    }
}
