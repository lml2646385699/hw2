import Language from './Language'
import Job from './Job'
import Authentication from './Authentication'
import HmOs from './HM_OS'
import BigData from './BigData'
import Cloud from './Cloud'
import AI from './AI'

@Component
export default struct FindCourse {
  @State changeValue: string = '';
  @State submitValue: string = '';

  submit(value: string): void {
    this.submitValue = value
  }
  change(value: string): void {
    this.changeValue = value
  }

  @Builder
  searchBuilder(): void {
    Search({ value: this.changeValue, placeholder: '问什么都可以' })
      .searchButton('搜索')
      .searchIcon({ src: $r('sys.media.ohos_ic_public_search_filled') })
      .width('90%')
      .height(30)
      .maxLength(90)
      .backgroundColor('#F5F5F5')
      .placeholderColor(Color.Grey)
      .placeholderFont({ size: 14, weight: 400 })
      .textFont({ size: 14, weight: 400 })
      .onSubmit((value: string) => {
        this.submit(value);
      })
      .onChange((value: string) => {
        this.change(value);
      })
      .alignSelf(ItemAlign.Center)
  }
  @Builder
  contentBuilder(): void {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Language()
      }
      .tabBar('语言')

      TabContent() {
        Job()
      }
      .tabBar('职业')

      TabContent() {
        Authentication()
      }
      .tabBar('认证')

      TabContent() {
        HmOs()
      }
      .tabBar('HM OS')

      TabContent() {
        BigData()
      }
      .tabBar('大数据')

      TabContent() {
        Cloud()
      }
      .tabBar('华为云')

      TabContent() {
        AI()
      }
      .tabBar('人工智能')

    }
    .vertical(true)
    .barWidth(100)
    .barHeight(300)
    .animationDuration(0)
    .height('90%')
    .scrollable(false)
    .margin({
      bottom: 20
    })
  }

  build(): void {
    Column({ space: 30 }) {
      this.searchBuilder();
      this.contentBuilder();
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .height('100%')

  }
}