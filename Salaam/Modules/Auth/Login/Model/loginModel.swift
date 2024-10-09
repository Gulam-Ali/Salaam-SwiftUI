//
//  loginModel.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation

struct serverErrorModel : Decodable {
    let message : String?
}

struct loginModel : Decodable {
    let id : Int?
    let username : String?
    let email : String?
    let firstName : String?
    let accessToken : String?
    let message : String?
}

/*
 {
   "id": 1,
   "username": "emilys",
   "email": "emily.johnson@x.dummyjson.com",
   "firstName": "Emily",
   "lastName": "Johnson",
   "gender": "female",
   "image": "https://dummyjson.com/icon/emilys/128",
   "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...", // JWT accessToken (for backward compatibility) in response and cookies
   "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." // refreshToken in response and cookies
 }
 */
