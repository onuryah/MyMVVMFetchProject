//
//  ExtensionString.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
