//
//  LoginViewController.swift
//  Instargram
//
//  Created by Walter yun on 2021/03/31.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    //구조체
    struct Constants {
        //테투리 각도 설정
        static let cornerRadius: CGFloat = 8.0
    }

    //아이디,이름 입력칸
    private let usernameEmailField: UITextField = {
        //UITextField 선언
        let field = UITextField()
        //아이디 칸에 출력될 placeholder
        field.placeholder = "이름 혹은 이메일"
        //키보드 엔터 next로 변경
        field.returnKeyType = .next
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
    
    //로그인 버튼 출력
    private let loginButton: UIButton = {
        //UI버튼 출력
         let button =  UIButton()
        button.setTitle("로그인", for: .normal)
        //테투리 각도 true
        button.layer.masksToBounds = true
        //구조체 가져오기 테투리 각도
        button.layer.cornerRadius = Constants.cornerRadius
        //버튼 배경색
        button.backgroundColor = .systemBlue
        //버튼 컬러
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //terms
    private let termsButton: UIButton = {
        //UI버튼 출력
        let button = UIButton()
        button.setTitle("서비스 및 약관", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    //privacy
    private let privacyButton: UIButton = {
        //UI버튼 출력
        let button = UIButton()
        button.setTitle("개인정보 보호 정책", for: .normal)
        button.setTitleColor(.secondaryLabel,
                             for: .normal)
        return button
    }()
    
    //privacy
    private let createAccountButton: UIButton = {
        let button = UIButton()
        //버튼 컬러
        button.setTitleColor(.label, for: .normal)
        //버튼 내용
        button.setTitle("새로운 계정 만들기", for: .normal)
        //리턴
        return button
    }()
    
    //헤더뷰
    private let headerView: UIView = {
        let header = UIView()
        //테두리 기준으로 잘림
        header.clipsToBounds = true
        //다운받은 이미지 출력
        let backgroundImageView = UIImageView(image:  UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        //로고 출력
        return header
        
    }()
    
    //***************** ViewDidLoad *****************//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //하위 뷰
        loginButton.addTarget(self, action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        createAccountButton.addTarget(self, action:#selector(didTapCreateAccountButton),
                                      for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubViews()
        
        //배경 색상 설정 systemBackground 라이트모드 or 다크모드
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        
        //헤더 뷰를 출력 ((x)가로세로, (y)크기)
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        )
        
        //유저이름(아이디) 출력 ((x)가로세로, (y)크기)
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width-50,
            height: 52.0
        )
        
        //비밀번호 출력 (((x)가로세로, (y)크기)
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        //로그인 버튼 출력 (((x)가로세로, (y)크기)
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        //계정 만들기 (((x)가로세로, (y)크기)
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom - 100,
                                   width: view.width-20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom - 50,
                                   width: view.width-20,
                                   height: 50)
        
            configureHeaderView()
        }
        
    //헤더뷰
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        
        guard let backgroundView = headerView.subviews.first else {
            return
            
        }
        backgroundView.frame = headerView.bounds
        
        //인스타그램 로고//
        //text라는 이름으로 된 이미지 뷰 보기
        let imageView = UIImageView(image: UIImage(named: "text"))
        
        headerView.addSubview(imageView)
        //콘텐츠의 비율을 유지하여 View 크기에 맞게 확장하는 옵션. 남는 영역은 투명
        imageView.contentMode = .scaleAspectFit
        //Assests에 있는 text 이미지 위치, 크기 설정
                                    //숫자가 클수록 화면의 크기가 작아짐
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 //safeAreaInserts 아이폰 x부터 설정되는 화면 높이 코드
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top
        )
    }

    
    
    //사용자 이름 필드
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    
    //로그인 버튼 생성
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        //변수생성(String)
        var username: String?
        var email: String?
        
        
        //로그인 기능
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            //이메일
            email = usernameEmail
        }
        else {
            //유저이름
            username = usernameEmail
        }
        
        //인증관리공유 (이름,이메일,패스워드)
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                //로그인에 성공했으면
                if success {
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    //에러 발생시 alert창 알람 출력
                    let alert = UIAlertController(title: "로그인 에러",
                                                  message: "아이디를 찾지 못했습니다.",
                                                  preferredStyle: .alert)
                    //닫기버튼 "타이틀 무시로 설정", style = cancel
                    alert.addAction(UIAlertAction(title: "무시",
                                                  style: .cancel,
                                                  handler: nil))
                    //경고 애니메이션
                    self.present(alert , animated: true)
                }
            }
        }
    }
    
    //
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://ko-kr.facebook.com/help/instagram/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    //
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://ko-kr.facebook.com/help/instagram/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    
    //계정 생성 버튼
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "새로운 계정 만들기"
        
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

//LoginViewController 메소드 추가
extension LoginViewController: UITextFieldDelegate {
    //텍스트필드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        //리턴
        return true
    }
}
