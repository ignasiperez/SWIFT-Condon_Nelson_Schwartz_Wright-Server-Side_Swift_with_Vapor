import Vapor


func routes(_ app: Application) throws {
  
  app.get { req in
    return "It works!"
  }
  
  
  app.get("hello") { req -> String in
    return "Hello, world!"
  }
  
  
  app.get("hello", "vapor") { req -> String in
    return "Hello Vapor!"
  }
  
  // 1
  app.get("hello", ":name") { req -> String in
    // 2
    guard let name = req.parameters.get("name")
    else {
      throw Abort(.internalServerError)
    }
    
    //3
    return "Hello, \(name)!"
  }
  
  
  app.post("info") { req -> String in
    let data = try req.content.decode(InfoData.self)
    
    return "Hello \(data.name)!"
  }
}


struct InfoData: Content {
  let name: String
}
