//
//  GenericVC.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class GenericVC: UIViewController {

    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    fileprivate let titles = ["Scan&Found Vibration",
                              "Email Notification",
                              "Introduction"]
    fileprivate let history = [("Self-Certification for Entities","09/11/2017 12:46 PM")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        cellRegistration()
    }
    
    private func UISetup(){
        //Fake navigation bar
        backBtn.setImage(AssetManager.back, for: .normal)
        rightBtn.setImage(AssetManager.power, for: .normal)
        
        //Search Bar
        searchBar.leftViewMode = .always
        searchBar.contentVerticalAlignment = .center
        let searchIcon = UIImageView(frame: CGRect(x: 25, y: 0, width: 50, height: 25))
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.image = AssetManager.search
        searchBar.leftView = searchIcon
        searchBar.attributedPlaceholder = NSAttributedString(string: "    Search document...",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        searchBar.layer.shadowColor = AssetManager.gray.cgColor
        searchBar.layer.shadowOpacity = 1
        searchBar.layer.shadowOffset = CGSize.zero
        searchBar.layer.shadowRadius = 10
        searchBar.layer.shadowPath = UIBezierPath(rect: searchBar.bounds).cgPath
    }
    
    private func cellRegistration(){
        list.register(UINib(nibName: "SettingCell", bundle:nil),
                      forCellReuseIdentifier: "SettingCell")
        list.register(UINib(nibName: "HistoryCell", bundle:nil),
                      forCellReuseIdentifier: "HistoryCell")
    }

    //MARK:IBActions
    @IBAction func back(_ sender: UIButton) {
    }
    
    @IBAction func rightTrigger(_ sender: UIButton) {
        
    }
    
    @IBAction func performAction(_ sender: UIButton) {
        sender.isEnabled = false
        startSpinning()
        UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.layer.transform = CATransform3DRotate(CATransform3DIdentity, 10, 0, 1, 0)
        }) { (success) in
            UIView.animate(withDuration: 0.5, animations: {
                self.titleLabel.text = self.titleLabel.text == "Recents" ? "Settings" : "Recents"
                if self.titleLabel.text == "Recents" {
                    self.rightBtn.setImage(AssetManager.delete, for: .normal)
                }else{
                    self.rightBtn.setImage(AssetManager.power, for: .normal)
                }
                self.rightBtn.transform = .identity
                self.titleLabel.layer.transform = CATransform3DIdentity
                sender.isEnabled = true
                DispatchQueue.main.async {
                    self.list.reloadData()
                    self.rightBtn.layer.removeAllAnimations()
                }
            })
        }
    }
    
    private func startSpinning(){
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat(.pi * 2.0 * 10)
        rotation.duration = 1
        rightBtn.layer.add(rotation, forKey: nil)
    }
    
}

extension GenericVC:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleLabel.text == "Recents" ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabel.text == "Recents" ? history.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if titleLabel.text == "Recents" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
            cell.titleLabel.text = history[indexPath.row].0
            cell.timeStamp.text = history[indexPath.row].1
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
            cell.titleLabel.text = titles[indexPath.section]
            cell.ns.isHidden = indexPath.section == 2
            cell.ns.setOn(indexPath.section == 0, animated: false)
            return cell
        }
    }
}

extension GenericVC:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            let des = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IVC")
            present(des, animated: true, completion: nil)
        }
    }
}

extension GenericVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
