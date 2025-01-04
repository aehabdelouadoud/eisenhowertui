#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "eisenhowertui" ? 0 : 1;
}
