#pragma once


namespace boost {
namespace python {
  class list;
}
}

namespace calc {
  class Field;
}



namespace pcraster_multicore {
namespace python {


calc::Field* maximum(boost::python::list const& arguments);


} // namespace python
} // namespace pcraster_multicore

