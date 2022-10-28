#!/bin/bash

cd main
composer install
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

composer run tests
FEATURE_FLAG_SHOW_RECOMMENDATIONS_ON_PRODUCT_LOOKUP=1 composer run tests
FEATURE_FLAG_CREATE_IMPRESSION_ON_PRODUCT_LOOKUP=1 composer run tests

ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

cd ..