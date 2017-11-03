//
//  FullProdViewController.swift
//  CrudTable
//
//  Created by Fabio Ziviello on 27/10/17.
//  Copyright © 2017 Fabio Ziviello. All rights reserved.
//

import UIKit

class FullProdViewController: UIViewController {
    @IBOutlet weak var lblNomeProdFull: UILabel!
    @IBOutlet weak var lblDescProdFull: UITextView!
    @IBOutlet weak var imgProdFull: UIImageView!
    
    
    
    var indice:Int!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNomeProdFull.text=SingProdotti.sharedIntance.arrayProd[indice].nome
        lblDescProdFull.text=SingProdotti.sharedIntance.arrayProd[indice].desc
        imgProdFull.image = SingProdotti.sharedIntance.arrayProd[indice].photo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueModifica" {
            
            let openView = segue.destination as! CaricaViewController
            openView.indice = indice
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
