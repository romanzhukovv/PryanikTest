//
//  ItemsData.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 26.05.2022.
//

import Foundation

struct ItemsData {
    let data: [Data]
    let view: [String]
    
    struct Data {
        let name: String
        let itemData: ItemData
        
        struct ItemData {
            let url: String
            let text: String
            let selectedId: Int
            let variants: [Variant]
            
            struct Variant {
                let id: Int
                let text: String
            }
        }
    }
}
