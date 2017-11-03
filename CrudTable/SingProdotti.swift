//
//  SingProdotti.swift
//  CrudTable
//
//  Created by Fabio Ziviello on 27/10/17.
//  Copyright © 2017 Fabio Ziviello. All rights reserved.
//

import UIKit

class SingProdotti{
    
    static let sharedIntance : SingProdotti = {
        let instance = SingProdotti()
        return instance
    }()
    
    var arrayProd : [Prodotto] = []
    
    
}




    
    


