//
//  TImerInfo.swift
//  MultiTImer
//
//  Created by macbookp on 04.07.2021.
//

import Foundation

final class TimerInfo {
    let name: String
    var counter: Double
    var isPlay: Bool
    
    init(name: String, counter: Double, isPlay: Bool) {
        self.name = name
        self.counter = counter
        self.isPlay = isPlay
    }
}
