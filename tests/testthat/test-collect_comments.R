test_that("collect_comments works", {
    expect_that(
        collect_comments("https://github.com/JiaxiangBU/add2gh/issues/2"),
        prints_text()
    )

})
