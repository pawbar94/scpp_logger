#include <scpp_logger.hpp>

#include "component_one.hpp"
#include "component_two.hpp"

int main(int argc, char** argv)
{
    scpp::Logger::SetLevel(scpp::LoggingLevel::kInfo);

    ComponentOne component_one;
    ComponentTwo component_two;

    component_one.DoSomething();
    component_two.DoSomething();
}