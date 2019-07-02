class Queries {
  static const getPosts = """
      query { 
        events(count:20) { 
          paginatorInfo { 
            count 
            hasMorePages 
          } 
          data { 
            title 
            description 
            user { 
              username
              profile { 
                forename
                surname
              }
            } 
          } 
        } 
      }
  """;
}
