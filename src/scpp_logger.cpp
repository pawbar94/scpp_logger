#include <iostream>
#include <mutex>

#include "scpp_logger.hpp"

namespace scpp {

std::mutex mtx;
LoggingLevel Logger::level_ = LoggingLevel::kInfo;

Logger::Logger(const std::string &name)
: name_{name}
{}

void Logger::SetLevel(const LoggingLevel level)
{
    try {
        std::lock_guard<std::mutex> lock(mtx);

        level_ = level;
    }
    catch (const std::exception &e) {
        std::cerr << "Error during setting logging level: " << e.what() << std::endl;
    }
    catch (...) {
        std::cerr << "Unknown error occured during setting logging level!" << std::endl;
    }
}
void Logger::Fatal(const std::string &message) const
{
    Log(message, LoggingLevel::kFatal);
}

void Logger::Error(const std::string &message) const
{
    Log(message, LoggingLevel::kError);
}

void Logger::Warning(const std::string &message) const
{
    Log(message, LoggingLevel::kWarning);
}

void Logger::Info(const std::string &message) const
{
    Log(message, LoggingLevel::kInfo);
}

void Logger::Debug(const std::string &message) const
{
    Log(message, LoggingLevel::kDebug);
}

void Logger::Verbose(const std::string &message) const
{
    Log(message, LoggingLevel::kVerbose);
}

void Logger::Log(const std::string &message, const LoggingLevel logging_level) const
{
    try {
        std::lock_guard<std::mutex> lock(mtx);

        if (level_ <= logging_level) {
            std::cout << "[" << LoggingLevelToString(logging_level) << "][" << name_ << "] " << message << std::endl;
        }
    }
    catch (const std::exception &e) {
        std::cerr << "Error during logging: " << e.what() << std::endl;
    }
    catch (...) {
        std::cerr << "Unknown error occurred during logging!" << std::endl;
    }
}

std::string Logger::LoggingLevelToString(const LoggingLevel level) const
{
    switch (level) {
        case LoggingLevel::kFatal:
            return "FATAL";
        case LoggingLevel::kError:
            return "ERROR";
        case LoggingLevel::kWarning:
            return "WARNING";
        case LoggingLevel::kInfo:
            return "INFO";
        case LoggingLevel::kDebug:
            return "DEBUG";
        case LoggingLevel::kVerbose:
            return "VERBOSE";
        default:
            return "INVALID";
    }
}

} // scpp