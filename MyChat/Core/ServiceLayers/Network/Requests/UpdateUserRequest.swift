//
//  UpdateUserRequest.swift
//  MyChat
//
//  Created by Сергей Штейман on 06.12.2022.
//

struct UpdateUserRequest {
    let accessToken: String
    let body: UpdateUserBody
}

struct UpdateUserBody: Encodable {
    let name: String
    let username: String
    let birthday: String?
    let city: String?
    let status: String?
    let avatar: UpdateUserAvatar?
    init(
        name: String,
        username: String,
        birthday: String,
        city: String,
        status: String,
        avatar: UpdateUserAvatar?
    ) {
        self.name = name
        self.username = username
        self.birthday = birthday
        self.city = city
        self.status = status
        self.avatar = avatar
    }
    init(userModel: UserModel, avatar: UpdateUserAvatar?) {
        self.name = userModel.name
        self.username = userModel.username
        self.birthday = FormatterDate.formatDate(userModel.birthday, format: .yyyyMMdd)
        self.city = userModel.city
        self.status = userModel.status
        self.avatar = avatar
    }
}

struct UpdateUserAvatar: Encodable {
    let filename: String
    let base64: String

    enum CodingKeys: String, CodingKey {
        case base64 = "base_64"
        case filename = "filename"
    }
    
    init(
        filename: String,
        base64: String
    ) {
        self.filename = filename
        self.base64 = base64
    }
    
    init?(base64: String?) {
        guard let base64 = base64 else {
            return nil
        }
        self.filename = "userAvatar"
        self.base64 = base64
    }
}
