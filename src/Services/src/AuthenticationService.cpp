#include "AuthenticationService.h"

bool AuthenticationService::authenticate(const AuthenticationData& data) {
    return (data.getUsername() == "admin") && (data.getPassword() == "admin");
}
