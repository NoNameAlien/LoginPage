#ifndef AUTHENTICATIONSERVICE_H
#define AUTHENTICATIONSERVICE_H

#include <string>
#include "AuthenticationData.h"

class AuthenticationService {
public:
    bool authenticate(const AuthenticationData& data);
};

#endif // AUTHENTICATIONSERVICE_H
