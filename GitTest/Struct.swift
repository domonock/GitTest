//
//  User.swift
//  GitTest
//
//  Created by Владимир Бабич on 31.10.2020.
//

import Foundation
import UIKit

/// https://app.quicktype.io  😂😂😂
// MARK: - Repo
struct Repo: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let itemDescription: String?
    let fork: Bool?
    let url, forksURL: String?
    let keysURL, collaboratorsURL: String?
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?
    let createdAt, updatedAt, pushedAt: Date?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorURL: JSONNull?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let forks, openIssues, watchers: Int?
    let defaultBranch: DefaultBranch?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID
        case name
        case fullName
        case itemPrivate
        case owner
        case htmlURL
        case itemDescription
        case fork, url
        case forksURL
        case keysURL
        case collaboratorsURL
        case teamsURL
        case hooksURL
        case issueEventsURL
        case eventsURL
        case assigneesURL
        case branchesURL
        case tagsURL
        case blobsURL
        case gitTagsURL
        case gitRefsURL
        case treesURL
        case statusesURL
        case languagesURL
        case stargazersURL
        case contributorsURL
        case subscribersURL
        case subscriptionURL
        case commitsURL
        case gitCommitsURL
        case commentsURL
        case issueCommentURL
        case contentsURL
        case compareURL
        case mergesURL
        case archiveURL
        case downloadsURL
        case issuesURL
        case pullsURL
        case milestonesURL
        case notificationsURL
        case labelsURL
        case releasesURL
        case deploymentsURL
        case createdAt
        case updatedAt
        case pushedAt
        case gitURL
        case sshURL
        case cloneURL
        case svnURL
        case homepage, size
        case stargazersCount
        case watchersCount
        case language
        case hasIssues
        case hasProjects
        case hasDownloads
        case hasWiki
        case hasPages
        case forksCount
        case mirrorURL
        case archived, disabled
        case openIssuesCount
        case license, forks
        case openIssues
        case watchers
        case defaultBranch
        case score
    }
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case main = "main"
    case master = "master"
    case rm = "rm"
}

// MARK: - License
struct License: Codable {
    let key, name, spdxID: String?
    let url: String?
    let nodeID: String?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID
        case url
        case nodeID
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: TypeEnum?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID
        case avatarURL
        case gravatarID
        case url
        case htmlURL
        case followersURL
        case followingURL
        case gistsURL
        case starredURL
        case subscriptionsURL
        case organizationsURL
        case reposURL
        case eventsURL
        case receivedEventsURL
        case type
        case siteAdmin
    }
}

enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
