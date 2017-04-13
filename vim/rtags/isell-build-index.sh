#!/bin/bash -e

ISELL_DIR=~/Workspace/isell
ISELL_DEPS_DIR=~/Workspace/isell-deps

cd ${ISELL_DIR}/IC

cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DSFC_64_DIR=${ISELL_DEPS_DIR}/sfc-1.20-cpp14 \
    -DBOOST_64_DIR=${ISELL_DEPS_DIR}/boost_1_55_0-cpp14 \
    -DLOG4CXX_64_DIR=${ISELL_DEPS_DIR}/apache-log4cxx-0.10.0-cpp14-SMTP/include  \
    -DXERCESC_64_DIR=${ISELL_DEPS_DIR}/xercesc-2.8.0-cpp14/include  \
    -DUNWIND_64_DIR=${ISELL_DEPS_DIR}/libunwind-1.1-cpp14  \
    -DCPPNETLIB_64_DIR=${ISELL_DEPS_DIR}/cpp-netlib-0.11.2-final  \
    -DCPPUNIT_64_DIR=${ISELL_DEPS_DIR}/cppunit-1.12.1-cpp14/include  \
    -DJEMALLOC_64_DIR=${ISELL_DEPS_DIR}/jemalloc-4.2.1-vanilla/include  \
    -DJEMALLOC_64_OLD_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-cpp14/include  \
    -DJEMALLOC_64_OLD_DEBUG_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-cpp14-d/include  \
    -DJEMALLOC_64_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-cpp14/include  \
    -DJEMALLOC_64_DEBUG_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-cpp14-d/include  \
    -DLZMA_64_DIR=${ISELL_DEPS_DIR}/xz-5.2.2  \
    -DPROTOBUF_64_DIR=${ISELL_DEPS_DIR}/protobuf-2.6.1  \
    -DYAMLCPP_64_DIR=${ISELL_DEPS_DIR}//yaml-cpp-master/include  \
    -DAMQ_64_DIR=${ISELL_DEPS_DIR}/activemq-cpp-library-3.9.3  \
    -DAPR_64_DIR=${ISELL_DEPS_DIR}/apr-1.4.6 \
    -DSFC_32_DIR=${ISELL_DEPS_DIR}sfc-1.20-32bit-cpp14 \
    -DBOOST_32_DIR=${ISELL_DEPS_DIR}/boost_1_55_0-32bit-cpp14  \
    -DLOG4CXX_32_DIR=${ISELL_DEPS_DIR}/apache-log4cxx-0.10.0-32bit-cpp14/include  \
    -DXERCESC_32_DIR=${ISELL_DEPS_DIR}/xercesc-2.8.0-32bit-cpp14/include  \
    -DUNWIND_32_DIR=${ISELL_DEPS_DIR}/libunwind-1.1-32bit-cpp14  \
    -DCPPUNIT_32_DIR=${ISELL_DEPS_DIR}/cppunit-1.12.1-32bit-cpp14/include  \
    -DJEMALLOC_32_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-32bit-cpp14/include  \
    -DYAMLCPP_32_DIR=${ISELL_DEPS_DIR}/yaml-cpp-master/include  \
    -DJEMALLOC_32_DEBUG_DIR=${ISELL_DEPS_DIR}/jemalloc-3.1.0-32bit-cpp14-d/include \
    -DC_CPP_DIALECT=c++14

ninja -t commands IntelliSell-Server-64 CacheServer-32 CacheSynchronizer-64 CachingProxy-64 \
    CacheManager-64 Test-CacheManager-64 Test-CacheServer-32 Test-CacheSynchronizer-64 \
    Test-IntelliSell-Server-64 | ~/Workspace/linux-workspace/vim/rtags/rtags/bin/rc -c -

cd -

