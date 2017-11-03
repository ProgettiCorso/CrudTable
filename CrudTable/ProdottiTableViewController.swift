//
//  ProdottiTableViewController.swift
//  CrudTable
//
//  Created by Fabio Ziviello on 27/10/17.
//  Copyright © 2017 Fabio Ziviello. All rights reserved.
//

import UIKit

class ProdottiTableViewController: UITableViewController {
    
    var prodotti = SingProdotti.sharedIntance.arrayProd
    var deleteProdottoIndexPath: IndexPath? = nil
    
    func confirmDelete() {
        let alert = UIAlertController(title: "Elimina Prodotto", message: "Sei Sicuro di voler eliminare il prodotto selezionato?", preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Elimina", style: .destructive, handler: handleDeleteProdotto)
        let CancelAction = UIAlertAction(title: "Annulla", style: .cancel, handler: cancelDeleteProdotto)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support display in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x:1.0, y:1.0, width:self.view.bounds.size.width / 2.0, height:self.view.bounds.size.height / 2.0)
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleDeleteProdotto(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteProdottoIndexPath {
            tableView.beginUpdates()
                SingProdotti.sharedIntance.arrayProd.remove(at:indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
                deleteProdottoIndexPath = nil
             tableView.endUpdates()
        }
    }
    
    func cancelDeleteProdotto(alertAction: UIAlertAction!) {
        deleteProdottoIndexPath = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingProdotti.sharedIntance.arrayProd.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellProdotto", for: indexPath) as? ListTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        let prodotto = prodotti[indexPath.row]
        
        cell.lblNomeProdotto.text=prodotto.nome
        cell.ImgProdotto.image=prodotto.photo
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Elimina") { (action, indexPath) in
            self.deleteProdottoIndexPath = indexPath
            self.confirmDelete()
        }
        
        let modify = UITableViewRowAction(style: .normal, title: "Modifica") { (action, indexPath) in
         
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let NewCaricaViewController = storyBoard.instantiateViewController(withIdentifier: "IDCaricaViewController") as! CaricaViewController
            NewCaricaViewController.indice=indexPath.row
            self.present(NewCaricaViewController, animated: true, completion: nil)
            
        }
        
        modify.backgroundColor = UIColor.blue
        
        return [delete,modify]
    }
    


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    
    // MARK: - Navigation

    override  func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        self.performSegue(withIdentifier: "segueProdotto", sender: tableView)
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueProdotto" {
            let openView = segue.destination as! FullProdViewController
            openView.indice = self.tableView.indexPathForSelectedRow?.row
        }
    
    }
    

}
