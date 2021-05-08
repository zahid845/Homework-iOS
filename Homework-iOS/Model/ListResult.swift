//
//  ListResult.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import Foundation



struct ListResult : Codable {
    let links : Links?
    let timestamp : String?
    let operation : String?
    let resultCode : String?
    let resultInfo : String?
    let returnCode : ReturnCode?
    let status : Status?
    let interaction : Interaction?
    let identification : Identification?
    let networks : Networks?
    let operationType : String?
    let style : Style?
    let payment : Payment?
    let integrationType : String?

    enum CodingKeys: String, CodingKey {

        case links = "links"
        case timestamp = "timestamp"
        case operation = "operation"
        case resultCode = "resultCode"
        case resultInfo = "resultInfo"
        case returnCode = "returnCode"
        case status = "status"
        case interaction = "interaction"
        case identification = "identification"
        case networks = "networks"
        case operationType = "operationType"
        case style = "style"
        case payment = "payment"
        case integrationType = "integrationType"
    }
}


struct Links : Codable {
    let logo : String?
    let selff : String?
    let lang : String?
    let operation : String?
    let validation : String?

    enum CodingKeys: String, CodingKey {

        case logo = "logo"
        case selff = "self"
        case lang = "lang"
        case operation = "operation"
        case validation = "validation"
    }
}


struct ReturnCode : Codable {
    let name : String?
    let source : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case source = "source"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        source = try values.decodeIfPresent(String.self, forKey: .source)
    }
    
}


struct Status : Codable {
    let code : String?
    let reason : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case reason = "reason"
    }
}



struct Interaction : Codable {
    let code : String?
    let reason : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case reason = "reason"
    }

}


struct Identification : Codable {
    let longId : String?
    let shortId : String?
    let transactionId : String?

    enum CodingKeys: String, CodingKey {

        case longId = "longId"
        case shortId = "shortId"
        case transactionId = "transactionId"
    }

}





struct Networks : Codable {
    let applicable : [Applicable]?

    enum CodingKeys: String, CodingKey {

        case applicable = "applicable"
    }
}


struct Style : Codable {
    let language : String?

    enum CodingKeys: String, CodingKey {

        case language = "language"
    }

}



struct Payment : Codable {
    let reference : String?
    let amount : Int?
    let currency : String?

    enum CodingKeys: String, CodingKey {

        case reference = "reference"
        case amount = "amount"
        case currency = "currency"
    }
}




struct Applicable : Codable {
    let code : String?
    let label : String?
    let method : String?
    let grouping : String?
    let registration : String?
    let recurrence : String?
    let redirect : Bool?
    let links : Links?
    let selected : Bool?
    let inputElements : [InputElements]?
    let operationType : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case label = "label"
        case method = "method"
        case grouping = "grouping"
        case registration = "registration"
        case recurrence = "recurrence"
        case redirect = "redirect"
        case links = "links"
        case selected = "selected"
        case inputElements = "inputElements"
        case operationType = "operationType"
    }
}



struct InputElements : Codable {
    let name : String?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case type = "type"
    }
}
