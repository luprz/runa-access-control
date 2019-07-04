# Api Docs


## Authentication

#### Create a  session:

**POST** `/api/v1/user/sign_in`

**PARAMS**
```javascript
{ 
    "user": {
        "email": "email@localhost.com"
        "password": "[Password]"
    } 
}
```

**RESPONSE**
```javascript
{
  "data": {
    "id": "1",
    "type": "users",
    "attributes": {
      "email": "email@localhost.com",
      "access-token": "b9fd219e93f889280c400aa3bf4928046538f09e"
      ...
    }
  }
}
```
