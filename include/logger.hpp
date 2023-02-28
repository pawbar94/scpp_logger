#pragma once

#include <string>

#include "logging_level.hpp"
#include "export_scpp_logger_api.hpp"

namespace scpp {

class PUBLIC_SCPP_LOGGER_API Logger
{
public:
    Logger(const std::string &name);

    static void SetLevel(const LoggingLevel level);
    void Fatal(const std::string &message) const;
    void Error(const std::string &message) const;
    void Warning(const std::string &message) const;
    void Info(const std::string &message) const;
    void Debug(const std::string &message) const;
    void Verbose(const std::string &message) const;

private:
    void Log(const std::string &message, const LoggingLevel logging_level) const;
    std::string LoggingLevelToString(const LoggingLevel level) const;

    std::string name_;
    static LoggingLevel level_;
};

} // scpp