//
//  data.swift
//  HikariSaber
//
//  Created by 冨田央子 on 2020/08/29.
//  Copyright © 2020 kentaro. All rights reserved.
//

import UIKit

class Data {
    
    var name: String!
    var imageName: String!
    
    
    init(name: String,imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    func getImage() -> UIImage{
        return UIImage(named: imageName)!
    }
    
}
