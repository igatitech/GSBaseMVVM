//
//  UserViewController.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 07/03/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewUserData : UITableView!
    
    //MARK:- Variables
    var userViewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        tableViewUserData.register(UINib(nibName: CellIdentifier.UserTableCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.UserTableCell)
        userViewModel.getUserDataFromNetworkManager(url: EndPoint.GetUserData) { (_) in
            DispatchQueue.main.async { [weak self] in
                self?.tableViewUserData.reloadData()
            }
        }
    }
}

extension UserViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.UserTableCell) as? UserTableCell
        cell?.userData = userViewModel.getUserAtIndex(index: indexPath.row)
        return cell!
    }
}
