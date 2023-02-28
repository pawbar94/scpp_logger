#pragma once

#include <string>

#include "logging_level.hpp"

namespace scpp {

class Logger
{
public:
    Logger(const std::string &name);

    void SetLevel(const LoggingLevel level);
    void Fatal(const std::string &message) const;
    void Error(const std::string &message) const;
    void Warning(const std::string &message) const;
    void Info(const std::string &message) const;
    void Debug(const std::string &message) const;
    void Verbose(const std::string &message) const;

private:
    std::string name_;
    static LoggingLevel level_;
};

} // scpp