@Component
export default struct ExchangePasswordSuccess {
  @Consume('pageInfos') pageInfos: NavPathStack;
  textTimerController: TextTimerController = new TextTimerController()

  @Builder
  contentBuilder(): void {
    Text('密码修改成功')
      .fontColor('#EC697B')
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .letterSpacing(2)
  }
  @Builder
  tailBuilder(): void {
    Row() {
      Divider()
        .width('20%')
        .color('#CFCFCF')
        .strokeWidth(1)
      Text('通鸿云')
        .fontColor('#CFCFCF')
        .margin({
          left: 10,
          right: 10
        })
        .fontSize(14)
      Divider()
        .width('20%')
        .color('#CFCFCF')
        .strokeWidth(1)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .margin({
      top: 320,
      bottom: 55
    })
  }
  @Builder
  timerBuilder(): void {
    TextTimer({ isCountDown:true, count: 3000, controller: this.textTimerController})
      .format('ss')
      .onAppear(() => {
        this.textTimerController.start()
      })
      .margin({
        right: -32
      })
      .opacity(0)
      .fontColor(Color.White)
      .fontSize(14)
      .onTimer((_utc: number, elapsedTime: number) => {
        if (elapsedTime == 3) {
          this.pageInfos.popToIndex(-1);
        }
      })
  }
  build(): void {
    NavDestination() {
      Column({ space: 30 }) {
        this.contentBuilder()
        this.timerBuilder()
        this.tailBuilder()
      }
      .width('85%')
      .height('100%')
      .justifyContent(FlexAlign.End)
    }
    .hideBackButton(true)
  }
}