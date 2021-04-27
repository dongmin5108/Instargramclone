 //
//  ViewController.swift
//  Instargram
//
//  Created by Walter yun on 2021/03/29.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        
    }
    
    private func handleNotAuthenticated(){
        // 인증 상태 확인
        if Auth.auth().currentUser == nil {
            //로그인 보기 (로그인 컨트롤러)
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

}

