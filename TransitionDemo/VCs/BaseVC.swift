//
//  BaseVC.swift
//  TransitionDemo
//
//  Created by Chiao on 2018/11/14.
//  Copyright © 2018年 Chaio. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.hidesBarsWhenVerticallyCompact = false
        navigationController?.hidesBarsOnTap = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func hideKeyBoard() {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    func showAlert(title: String, msg: String = "") {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
