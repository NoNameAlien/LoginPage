#ifndef AUTHENTICATIONSERVICE_H
#define AUTHENTICATIONSERVICE_H

#include <DTOs/AuthenticationData.h>

#include <string>

class AuthenticationService {
public:
    bool authenticate(const AuthenticationData& data);
};

#endif // AUTHENTICATIONSERVICE_H
