//
//  HomeViewController.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    var paymentMethodsArray = [Applicable]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paymentCellNib = UINib.init(nibName: "PaymentTableViewCell", bundle: nil)
        tableView.register(paymentCellNib, forCellReuseIdentifier: paymentTableCellReuseID)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getJSONDataAndCheckForPossibleErrors()
    }

    
    
    //MARK: - Check JSON Data For Possible Errors
    func getJSONDataAndCheckForPossibleErrors() {
        guard let urlString = URL(string: urlToApi) else { return }
        
        Networking.shared.fetchJSON(url: urlString) {(result) in
            
            switch result {
            case .success(let pMethods):
                print("success")

                self.paymentMethodsArray = pMethods
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            case .failure(let err):
                print("Failed to fetch courses", err)
            }
        }
    }


}



//MARK: - TableView Delegate & DataSource Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentMethodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentTableCellReuseID, for: indexPath) as! PaymentTableViewCell
        
        cell.pNameLb.text = paymentMethodsArray[indexPath.row].label
        
        //Download Image, assign it and Cache it
        guard let url  = URL(string: (paymentMethodsArray[indexPath.row].links?.logo)!) else { return cell}
        
        DispatchQueue.main.async {
            cell.pImgView.loadImageWithUrl(url)
        }

        return cell

    }
}

