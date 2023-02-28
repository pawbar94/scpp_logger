#include <iostream>
#include <mutex>

#include "logger.hpp"

namespace scpp {

std::mutex cout_mutex;
LoggingLevel Logger::level_ = LoggingLevel::kInfo;

Logger::Logger(const std::string &name)
: name_{name}
{}

void Logger::SetLevel(const LoggingLevel level)
{
    level_ = level;
}
void Logger::Fatal(const std::string &message) const
{
    if (level_ >= LoggingLevel::kFatal) {
        std::cerr << "[FATAL][" << name_ << "] " << message << std::endl;
    }
}

void Logger::Error(const std::string &message) const
{
    if (level_ >= LoggingLevel::kError) {
        std::cerr << "[ERROR][" << name_ << "] " << message << std::endl;
    }
}

void Logger::Warning(const std::string &message) const
{
    if (level_ >= LoggingLevel::kWarning) {
        std::cerr << "[WARNING][" << name_ << "] " << message << std::endl;
    }
}

void Logger::Info(const std::string &message) const
{
    if (level_ >= LoggingLevel::kInfo) {
        std::cout << "[INFO][" << name_ << "] " << message << std::endl;
    }
}

void Logger::Debug(const std::string &message) const
{
    if (level_ >= LoggingLevel::kDebug) {
        std::cout << "[DEBUG][" << name_ << "] " << message << std::endl;
    }
}

void Logger::Verbose(const std::string &message) const
{
    if (level_ >= LoggingLevel::kVerbose) {
        std::cout << "[VERBOSE][" << name_ << "] " << message << std::endl;
    }
}

} // scpp