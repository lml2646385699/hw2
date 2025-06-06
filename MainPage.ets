import Index from './Index'
import My from './My'
import Sport from './Findcourse'
import Study from './Study'
import { User } from './Login/Login';

@Component
export default struct MainPage {
  @Link user: User;
  @State currentIndex: number = 0
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Builder
  barBuilder(index: number, label: string, icon: string, iconFill: string) {
    Column() {
      Image(this.currentIndex == index ? $rawfile(iconFill) : $rawfile(icon))
        .width(28)
      Text(label)
        .fontSize(12)
        .fontColor(this.currentIndex == index ? '#ff117ed4' : Color.Black)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }

  @Builder
  pageBuilder(): void {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      TabContent() {
        Index()
      }
      .tabBar(this.barBuilder(0, '首页', 'icon/home.svg', 'icon/home_fill.svg'))
      .backgroundColor('#F2F3F5')

      TabContent() {
        Sport()
      }
      .tabBar(this.barBuilder(1, '找课', 'icon/搜索.svg', 'icon/搜索_fill.svg'))

      TabContent() {
        Study()
      }
      .tabBar(this.barBuilder(2, '学习', 'icon/学习.svg', 'icon/学习_fill.svg'))

      TabContent() {
        My({ user: this.user })
      }
      .tabBar(this.barBuilder(3, '我的', 'icon/my.svg', 'icon/my_fill.svg'))
    }
    .vertical(false)
    .width('100%')
    .height('100%')
    .scrollable(false)
    .animationDuration(0)
    .barBackgroundColor('#F2F3F5')
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }

  build() {
    NavDestination() {
      this.pageBuilder()
    }
    .hideBackButton(true)
  }
}
