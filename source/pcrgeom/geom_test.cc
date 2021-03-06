#define BOOST_TEST_MODULE geom test suite
#ifndef INCLUDED_STDDEFX
#include "stddefx.h"
#define INCLUDED_STDDEFX
#endif

#ifndef INCLUDED_PCRDLL
#include "pcrdll.h"
#define INCLUDED_PCRDLL
#endif


#ifndef INCLUDED_BOOST_TEST_INCLUDED_UNIT_TEST
#include <boost/test/included/unit_test.hpp>
#define INCLUDED_BOOST_TEST_INCLUDED_UNIT_TEST
#endif
#ifndef INCLUDED_GEOM_PRDIMTREETEST
#include "geom_prdimtreetest.h"
#define INCLUDED_GEOM_PRDIMTREETEST
#endif


boost::unit_test::test_suite* init_unit_test_suite(int /* argc */, char ** const /*argv*/) {
{
  boost::unit_test::test_suite* test = BOOST_TEST_SUITE(__FILE__);

  test->add(geom::PRDimTreeTest().suite());

  return test;
}

