#ifndef AUTHENTICATIONDATA_H
#define AUTHENTICATIONDATA_H

#include <string>

class AuthenticationData {
 public:
  AuthenticationData(const std::string& username, const std::string& password);
  std::string getUsername() const;
  std::string getPassword() const;

 private:
  std::string username;
  std::string password;
};

#endif  // AUTHENTICATIONDATA_H
