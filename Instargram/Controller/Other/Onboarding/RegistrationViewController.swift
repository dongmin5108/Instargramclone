//
//  RegistrationViewController.swift
//  Instargram
//
//  Created by Walter yun on 2021/03/31.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //구조체
    struct Constants {
        //테투리 각도 설정
        static let cornerRadius: CGFloat = 8.0
    }

    //아이디,이름 입력칸
    private let usernameField: UITextField = {
        //UITextField 선언
        let field = UITextField()
        //아이디 칸에 출력될 placeholder
        field.placeholder = "이름"
        //키보드 엔터 next로 변경
        field.returnKeyType = .next
        //
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        //대소문자설정 항상 소문자로출력
        field.autocapitalizationType = .none
        //텍스트 예측 비활성
        field.autocorrectionType = .no
        //테투리 둥굴게
        field.layer.masksToBounds = true
        //구조체 가져오기
        field.layer.cornerRadius = Constants.cornerRadius
        //배경색 설정
        field.backgroundColor = .secondarySystemBackground
        //테두리 두께
        field.layer.borderWidth = 1.0
        //테투리 색상
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        //리턴
        return field
    }()
    
    //아이디,이름 입력칸
    private let emailField: UITextField = {
        //UITextField 선언
        let field = UITextField()
        //아이디 칸에 출력될 placeholder
        field.placeholder = "이메일 주소"
        //키보드 엔터 next로 변경
        field.returnKeyType = .next
        //
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        //대소문자설정 항상 소문자로출력
        field.autocapitalizationType = .none
        //텍스트 예측 비활성
        field.autocorrectionType = .no
        //테투리 둥굴게
        field.layer.masksToBounds = true
        //구조체 가져오기
        field.layer.cornerRadius = Constants.cornerRadius
        //배경색 설정
        field.backgroundColor = .secondarySystemBackground
        //테두리 두께
        field.layer.borderWidth = 1.0
        //테투리 색상
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        //리턴
        return field
    }()
    
    //유저 비밀번호 출력
    private let passwordField: UITextField = {
        let field = UITextField()
        //암호화로 출력
        field.isSecureTextEntry = true
        //아이디 칸에 출력될 placeholder
        field.placeholder = "비밀번호"
        //키보드 엔터 next로 변경
        field.returnKeyType = .continue
        //
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        //대소문자설정 항상 소문자로출력
        field.autocapitalizationType = .none
        //텍스트 예측 비활성
        field.autocorrectionType = .no
        //테투리 둥굴게
        field.layer.masksToBounds = true
        //구조체 가져오기
        field.layer.cornerRadius = Constants.cornerRadius
        //테두리 두께
        field.layer.borderWidth = 1.0
        //테투리 색상
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        //위에 있는 field로 리턴
        return field
    }()
    
    //등록버튼 출력
    private let registerButton: UIButton = {
        //UI버튼 출력
         let button =  UIButton()
        button.setTitle("회원가입", for: .normal)
        //테투리 각도 true
        button.layer.masksToBounds = true
        //구조체 가져오기 테투리 각도
        button.layer.cornerRadius = Constants.cornerRadius
        //버튼 배경색
        button.backgroundColor = .systemGreen
        //버튼 컬러
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        //subview
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)

        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //각 버튼 크기,위치 설정
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+100, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom+10, width: view.width-40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom+10, width: view.width-40, height: 52)

    }
    
    @objc private func didTapRegister() {
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8,
              let username = usernameField.text,!username.isEmpty else {
            return
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else {
            didTapRegister()
        }
        
        return true
    }
}
