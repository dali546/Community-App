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

  static const validateToken = r"""
    query {
      validateToken
    }
  """;

  static const login = r"""
    mutation Login($input: LoginInput!){
      login(
        data: $input
      )
      {
        access_token
        refresh_token
        expires_in
        token_type
        user {
          username
          email
          profile {
            forename
            surname
            birthday
            gender
          }
        }   
      }
    }
  """;
}
