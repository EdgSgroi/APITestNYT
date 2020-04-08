//
//  Response.swift
//  APITestNYT
//
//  Created by Edgar Sgroi on 08/04/20.
//  Copyright © 2020 Edgar Sgroi. All rights reserved.
//

import Foundation

struct Response: Codable {
    let results: [Article]
}
