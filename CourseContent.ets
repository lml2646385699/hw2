@Component
export default struct CourseContent {
  @Builder
  courseContentBuilder() {
    Column() {
      Text('CourseContent 页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
  build() {
    NavDestination() {
      this.courseContentBuilder();
    }
    .hideBackButton(true);
  }
}
