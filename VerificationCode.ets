@Component
export default struct VerificationCode {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Link verificationCode: number;

  @Builder
  contentBuilder(): void {
    Column({ space: 10 }) {
      Text('软通动力')
        .fontSize(20)
      Text('通鸿云课堂')
        .margin({
          top: 50
        })
      Text('       验证码:')
      Text(this.verificationCode.toString())
        .fontSize(50)
        .margin({
          top: 10,
          left: 40
        })
        .fontWeight(FontWeight.Bold)
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .height('80%')
    .width('80%')
  }
  @Builder
  verificationCodeBuilder(): void {
    Button({ type: ButtonType.Normal, stateEffect: false }) {
      this.contentBuilder();
    }
    .borderColor(Color.Black)
    .border({ width: 1 })
    .backgroundColor('#F4F6F5')
    .height('70%')
    .width('80%')
    .borderRadius(10)
    .margin({
      top: 20
    })
  }
  build(): void {
    NavDestination() {
      this.verificationCodeBuilder();
    }
    .title('信息')
  }
}