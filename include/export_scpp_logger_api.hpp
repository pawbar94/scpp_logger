#pragma once

#if defined (_WIN32) || defined (__CYGWIN__)
    #if defined (EXPORT_SCPP_LOGGER_API)
        #ifdef __GNUC__
            #define PUBLIC_SCPP_LOGGER_API __attribute__ ((dllexport))
        #else
            #define PUBLIC_SCPP_LOGGER_API __declspec(dllexport)
        #endif
    #else
        #ifdef __GNUC__
            #define PUBLIC_SCPP_LOGGER_API __attribute__ ((dllimport))
        #else
            #define PUBLIC_SCPP_LOGGER_API __declspec(dllimport)
        #endif
    #endif
    #define NOT_EXPORTED
#else
    #if __GNUC__ >= 4
        #define PUBLIC_SCPP_LOGGER_API __attribute__ ((visibility ("default")))
        #define NOT_EXPORTED __attribute__ ((visibility ("hidden")))
    #else
        #define PUBLIC_SCPP_LOGGER_API
        #define NOT_EXPORTED
    #endif
#endif