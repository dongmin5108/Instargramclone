//
//  File.swift
//  Instargram
//
//  Created by Walter yun on 2021/03/31.
//

import FirebaseDatabase

//데이터베이스 가져오기
public class DatabaseManager {
    
    //데이터베이스 관리자 사용
    static let shared = DatabaseManager()
    
    private let database = Database.database()
    
    // MARK: - Public
   
    //유저이름 이메일 가능
    //파라미터
    // 
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        
    }
        
    public func insertNewUser(with email: String, username: String) {
        database.
    }
    
    
}
