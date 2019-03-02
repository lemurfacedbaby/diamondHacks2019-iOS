//  This file was automatically generated and should not be edited.

import Apollo

public final class AllJobsQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllJobs {\n  jobs {\n    __typename\n    id\n    title\n    salary\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["query_root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("jobs", type: .nonNull(.list(.nonNull(.object(Job.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(jobs: [Job]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "jobs": jobs.map { (value: Job) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "jobs"
    public var jobs: [Job] {
      get {
        return (resultMap["jobs"] as! [ResultMap]).map { (value: ResultMap) -> Job in Job(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Job) -> ResultMap in value.resultMap }, forKey: "jobs")
      }
    }

    public struct Job: GraphQLSelectionSet {
      public static let possibleTypes = ["jobs"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("salary", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, salary: String) {
        self.init(unsafeResultMap: ["__typename": "jobs", "id": id, "title": title, "salary": salary])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var salary: String {
        get {
          return resultMap["salary"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "salary")
        }
      }
    }
  }
}
