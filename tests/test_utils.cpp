#include <gtest/gtest.h>
#include "utils.h"

TEST(UtilsTest, PrintMessageTest) {
    // This is a simple test that just verifies the function can be called
    // In a real test, you might capture stdout or use a mock
    EXPECT_NO_THROW(utils::print_message("Test message"));
}