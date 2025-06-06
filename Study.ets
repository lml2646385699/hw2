@Component
export default struct Study {
  @State className: string[] = ['HarmonyOS应用开发班',
  'ArkTS基础学习群', '华为开发者交流群', '高级UI设计班'];
  @State classMembers: number[] = [ 128, 86, 245, 72 ];
  @State classActivity: string[] = [ '高', '中', '高', '中' ]
  @State classes: number[] = [ 0, 1, 2, 3 ]

  build() {
    Stack({ alignContent: Alignment.Center }) {
      // 模态框内容
      Column() {
        // 头部
        Row() {
          Text('班级群')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text('×')
            .fontSize(24)
            .fontColor('#6c757d')
        }
        .width('100%')
        .height(50)
        .margin({ top: 20, left: 20, right: 20 })

        // 班级列表
        List() {
          ForEach(this.classes, (item: number) => {
            ListItem() {
              Row() {
                /*Image($r('app.media.ic_group'))
                  .width(20)
                  .height(20)
                  .margin({ right: 12 })*/
                Column({ space: 4 }) {
                  Text(this.className[item])
                    .fontSize(16)
                  Text(`成员: ${this.classMembers[item]}人 | 活跃: ${this.classActivity[item]}`)
                    .fontSize(14)
                    .fontColor('#6c757d')
                }
                .width('70%')
                .margin({ left: 0 })

                Button('进入')
                  .fontSize(14)
                  .fontColor(Color.White)
                  .backgroundColor('#0a59f7')
                  .width(60)
                  .height(32)
                  .borderRadius(16)
                  .onClick(() => {
                    AlertDialog.show({
                      message: `成功加入 ${this.className[item]}`,
                      autoCancel: true,
                    });
                  })
              }
              .width('100%')
              .height(60)
              .margin({ left: 20, right: 20 })
            }
          })
        }
        .width('100%')
        .height(300)
        .margin({ top: 10 })
      }
      .width('90%')
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({ radius: 10, color: '#00000033' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
    .position({ x: 0, y: 0 })
  }
}