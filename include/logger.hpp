#pragma once

#include <string>

#include "logging_level.hpp"
#include "export_scpp_logger_api.hpp"

namespace scpp {

class PUBLIC_SCPP_LOGGER_API Logger
{
public:
    /**
     * @brief Constructor.
     * @param name Name of the component in which particular logger instance is used.
     */
    Logger(const std::string &name);
    /**
     * @brief Allows to set global logging level across all the logger instances used.
     * @param level Logging level to be set.
     */
    void SetLevel(const LoggingLevel level);
    /**
     * @brief Log a fatal error message. Use this function for logging in case of unrecoverable component error.
     * @param message Message content.
     */
    void Fatal(const std::string &message) const;
    /**
     * @brief Log an error message. Use this function for logging in case of recoverable component error.
     * @param message Message content.
     */
    void Error(const std::string &message) const;
    /**
     * @brief Log a warning message. Use this function for logging in case of potentially problematic situation which
     *        however does not necessarly lead to a higher level error.
     * @param message Message content.
     */
    void Warning(const std::string &message) const;
    /**
     * @brief Log an information message. Use this function for logging information valueable for the user during normal usage.
     * @param message Message content.
     */
    void Info(const std::string &message) const;
    /**
     * @brief Log a debug message. Use this function for logging information helpful for the user during debugging.
     * @param message Message content.
     */
    void Debug(const std::string &message) const;
    /**
     * @brief Log a verbose message. Use this function for logging information helpful for the software developer during software development.
     * @param message Message content.
     */
    void Verbose(const std::string &message) const;

private:
    void Log(const std::string &message, const LoggingLevel logging_level) const;
    std::string LoggingLevelToString(const LoggingLevel level) const;

    std::string name_;
    static LoggingLevel level_;
};

} // scpp