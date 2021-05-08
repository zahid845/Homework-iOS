//
//  HomeViewController.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let paymentTableCellReuseID = "paymentTableCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paymentCellNib = UINib.init(nibName: "PaymentTableViewCell", bundle: nil)
        tableView.register(paymentCellNib, forCellReuseIdentifier: paymentTableCellReuseID)

    }

}



//MARK: - TableView Delegate & DataSource Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentTableCellReuseID, for: indexPath) as! PaymentTableViewCell
        print("cellForRowAt \(indexPath.row)")
        return cell

    }
}

