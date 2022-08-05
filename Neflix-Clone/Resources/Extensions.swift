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
    
}
