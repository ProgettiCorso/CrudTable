//
//  CaricaViewController.swift
//  CrudTable
//
//  Created by Fabio Ziviello on 27/10/17.
//  Copyright © 2017 Fabio Ziviello. All rights reserved.
//

import UIKit

class CaricaViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var TxtNomeProdotto: UITextField!
    @IBOutlet weak var TxtDesc: UITextView!
    @IBOutlet weak var ImgProdotto: UIImageView!
    
    var indice:Int!
    let errColor = UIColor.red
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (indice != nil)
        {
            if(SingProdotti.sharedIntance.arrayProd[indice].photo == #imageLiteral(resourceName: "default_photo") )
            {
                ImgProdotto.image = #imageLiteral(resourceName: "gallery_icon")
            }
            else{
                ImgProdotto.image=SingProdotti.sharedIntance.arrayProd[indice].photo
            }
            TxtNomeProdotto.text=SingProdotti.sharedIntance.arrayProd[indice].nome
            TxtDesc.text=SingProdotti.sharedIntance.arrayProd[indice].desc
  
            
        }
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SalvaProdotto(_ sender: Any) {
        
        //validate
        if (indice != nil)
        {
            SingProdotti.sharedIntance.arrayProd[indice].nome=TxtNomeProdotto.text!
            SingProdotti.sharedIntance.arrayProd[indice].desc=TxtDesc.text!
            if(SingProdotti.sharedIntance.arrayProd[indice].photo == #imageLiteral(resourceName: "gallery_icon"))
            {
                SingProdotti.sharedIntance.arrayProd[indice].photo = #imageLiteral(resourceName: "default_photo")
            }else if(SingProdotti.sharedIntance.arrayProd[indice].photo == #imageLiteral(resourceName: "default_photo"))
            {
                SingProdotti.sharedIntance.arrayProd[indice].photo = #imageLiteral(resourceName: "default_photo")
            }
            else{
                SingProdotti.sharedIntance.arrayProd[indice].photo=ImgProdotto.image
            }
            
        }
        else{
            
           
            
            if(TxtNomeProdotto.text! != "")
            {
                if(ImgProdotto.image == #imageLiteral(resourceName: "gallery_icon"))
                {
                    ImgProdotto.image = #imageLiteral(resourceName: "default_photo")
                }
                SingProdotti.sharedIntance.arrayProd.append(Prodotto(nome: TxtNomeProdotto.text!,desc: TxtDesc.text, photo: ImgProdotto.image))
            }
            else{
                let alert = UIAlertController(title: "Errore", message: "Inserire nome prodotto.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .`default`))
                self.present(alert, animated: true, completion: nil)
                TxtNomeProdotto.layer.borderColor = errColor.cgColor
                TxtNomeProdotto.layer.borderWidth = 1.0
            }
            
        }
        if(TxtNomeProdotto.text! == "")
        {

            let alert = UIAlertController(title: "Errore", message: "Inserire nome prodotto.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .`default`))
            self.present(alert, animated: true, completion: nil)
            TxtNomeProdotto.layer.borderColor = errColor.cgColor
            TxtNomeProdotto.layer.cornerRadius = 5.0
            TxtNomeProdotto.layer.borderWidth = 1.0
        }
        
        self.performSegue(withIdentifier: "segueHome", sender: CaricaViewController.self)

    }
    
    @IBAction func tapUpdateImage(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueHome" {
            let _ = segue.destination as! ProdottiTableViewController
            
        }
        
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        ImgProdotto.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }

}
