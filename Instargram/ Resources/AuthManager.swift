//
//  AuthManager.swift
//  Instargram
//
//  Created by Walter yun on 2021/03/31.
//

import FirebaseAuth

// 인증 관리자
public class AuthManager {
    
    //인증 관리자 사용
    static let shared = AuthManager()
    
    // 사용자 정보 (유저이름,이메일,비밀번호 = 문자열)
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - 유저이름 체크 가능한지
         - 이메일 체크 가능한지
         */
        
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreat in
            if canCreat {
                /*
                 - 새로운 계정
                 - 데이터베이스에 삽입
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        //firebase 에 새로운 계정을 만들수 없음
                        completion(false)
                        return
                    }
                    
                    //DB 에 삽입
                    
                }
            }
            else {
                
                completion(false)
                
            }
        }
        
    }
    
    // 로그인 (유저이름,이메일,비밀번호 = 문자열)
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        //email 선언
        if let email = email {
            //이메일,패스워드 입력 (email로그인기능)
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    //리턴
                    return
                }
                //완료가true
                completion(true)
            }
        }
        //username 선언
        else if let username = username {
            // 유저이름 로그인 방식
            print(username)
        }
    }
}
