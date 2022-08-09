//
//  Extensions.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 02/08/22.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        
        return self.prefix(1).uppercased() + self.dropFirst().lowercased()
    }
    
    func clampString() -> String {
        if self.count < 20 {
            return self
        }
        let lowerBound = String.Index(utf16Offset: 0, in: self)
        let upperBound = String.Index(utf16Offset: 20, in: self)
        let myString = self[lowerBound..<upperBound] + "..."
        return String(myString)
        
    }
    
}
