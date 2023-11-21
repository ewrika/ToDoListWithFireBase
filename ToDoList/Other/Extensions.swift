//
//  Extensions.swift
//  ToDoList
//
//  Created by Георгий Борисов on 21.11.2023.
//

import Foundation

extension Encodable{
    func asDictionary()->[String:Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch{
            return [:]
        }
    }
}

//https://youtu.be/pAB1tMH6TFc?list=PL5PR3UyfTWvei-pKlZN7d8r-0tHCK1EKE

