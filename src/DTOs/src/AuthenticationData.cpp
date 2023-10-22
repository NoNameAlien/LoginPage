#include "AuthenticationData.h"

AuthenticationData::AuthenticationData(const std::string& username, const std::string& password)
    : username(username), password(password) {}

std::string AuthenticationData::getUsername() const {
    return username;
}

std::string AuthenticationData::getPassword() const {
    return password;
}
