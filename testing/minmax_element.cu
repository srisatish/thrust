#include <thrusttest/unittest.h>
#include <thrust/extrema.h>

template <class Vector>
void TestMinMaxElementSimple(void)
{
    typedef typename Vector::value_type T;

    Vector data(6);
    data[0] = 3;
    data[1] = 5;
    data[2] = 1;
    data[3] = 2;
    data[4] = 5;
    data[5] = 1;

    ASSERT_EQUAL( *thrust::minmax_element(data.begin(), data.end()).first,  1);
    ASSERT_EQUAL( *thrust::minmax_element(data.begin(), data.end()).second, 5);
    ASSERT_EQUAL(  thrust::minmax_element(data.begin(), data.end()).first  - data.begin(), 2);
    ASSERT_EQUAL(  thrust::minmax_element(data.begin(), data.end()).second - data.begin(), 1);
}
DECLARE_VECTOR_UNITTEST(TestMinMaxElementSimple);

template<typename T>
void TestMinMaxElement(const size_t n)
{
    thrust::host_vector<T>   h_data = thrusttest::random_samples<T>(n);
    thrust::device_vector<T> d_data = h_data;

    typename thrust::host_vector<T>::iterator   h_min;
    typename thrust::host_vector<T>::iterator   h_max;
    typename thrust::device_vector<T>::iterator d_min;
    typename thrust::device_vector<T>::iterator d_max;

//    h_min = thrust::minmax_element(h_data.begin(), h_data.end()).first;
    d_min = thrust::minmax_element(d_data.begin(), d_data.end()).first;
//    h_max = thrust::minmax_element(h_data.begin(), h_data.end()).second;
//    d_max = thrust::minmax_element(d_data.begin(), d_data.end()).second;
//
//    ASSERT_EQUAL(h_min - h_data.begin(), d_min - d_data.begin());
//    ASSERT_EQUAL(h_max - h_data.begin(), d_max - d_data.begin());
//    
//    h_max = thrust::minmax_element(h_data.begin(), h_data.end(), thrust::greater<T>()).first;
//    d_max = thrust::minmax_element(d_data.begin(), d_data.end(), thrust::greater<T>()).first;
//    h_min = thrust::minmax_element(h_data.begin(), h_data.end(), thrust::greater<T>()).second;
//    d_min = thrust::minmax_element(d_data.begin(), d_data.end(), thrust::greater<T>()).second;
//
//    ASSERT_EQUAL(h_min - h_data.begin(), d_min - d_data.begin());
//    ASSERT_EQUAL(h_max - h_data.begin(), d_max - d_data.begin());
}
DECLARE_VARIABLE_UNITTEST(TestMinMaxElement);
